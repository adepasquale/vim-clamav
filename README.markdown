# clamav.vim

This Vim plugin aims at making ClamAV rules easier to read and write.

It's still work in progress. For now it has the following features:

- [x] Basic syntax highlighting for ClamAV .ldb files
- [ ] Full syntax highlighting for any ClamAV file
- [ ] Hex dumping of any string (`sigtool --hex-dump`)
- [ ] Signature decoding with `sigtool --decode-sigs`
- [ ] Malformed database detection using `clamscan -d`

Check out or request additional features in the issue tracker.

