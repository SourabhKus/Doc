
func bToMb(b uint64) float64 {
	return float64(b / 1024.0 / 1024)
}

func Hello() {
file, err := os.Open("/proc/meminfo") //procFilePath("meminfo"))
		if err != nil {
			fmt.Println(err)
		}
		defer file.Close()

		var (
			memInfo  = map[string]float64{}
			scanner  = bufio.NewScanner(file)
			reParens = regexp.MustCompile(`\((.*)\)`)
		)

		for scanner.Scan() {
			line := scanner.Text()
			parts := strings.Fields(line)
			// Workaround for empty lines occasionally occur in CentOS 6.2 kernel 3.10.90.
			if len(parts) == 0 {
				continue
			}
			fv, err := strconv.ParseFloat(parts[1], 64)
			if err != nil {
				fmt.Errorf("invalid value in meminfo: %w", err)
			}
			key := parts[0][:len(parts[0])-1] // remove trailing : from key
			// Active(anon) -> Active_anon
			key = reParens.ReplaceAllString(key, "_${1}")
			switch len(parts) {
			case 2: // no unit
			case 3: // has unit, we presume kB
				fv *= 1024
				key = key + "_bytes"
			default:
				fmt.Errorf("invalid line in meminfo: %s", line)
			}
			memInfo[key] = fv
		}

		fmt.Println(memInfo)
		var mStats runtime.MemStats
		runtime.ReadMemStats(&mStats)
		fmt.Println(bToMb(mStats.Alloc))
}
