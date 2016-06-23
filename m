From: mturquette@baylibre.com (Michael Turquette)
Date: Wed, 22 Jun 2016 19:12:20 -0700
Subject: [PATCH v2 0/3] arm64: amlogic: support gxbb clock controller
Message-ID: <1466647943-23193-1-git-send-email-mturquette@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This series breaks out some clean-up patches and the changes to dts from
v1 of the meson8b[0] and gxbb[1] clk driver series. This was done to
make it easy for the AmLogic maintainers to take only these patches if
they want. Additionally there is a shared, immutable branch with the
gxbb clk driver if the amlogic maintainers wish to merge that into their
tree:

git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-s905

The only functional change was to nest the clock-controller node inside
of the hiubus node, as suggested by Kevin.

[0] Link: lkml.kernel.org/g/1465518467-23939-1-git-send-email-mturquette at baylibre.com
[1] Link: lkml.kernel.org/g/1465518774-26924-1-git-send-email-mturquette at baylibre.com

Michael Turquette (3):
  arm: meson: explicitly select clk drivers
  arm64: amlogic: select gxbb clk driver
  arm64: dts: gxbb clock controller

 arch/arm/mach-meson/Kconfig                 | 3 +++
 arch/arm64/Kconfig.platforms                | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 6 ++++++
 3 files changed, 11 insertions(+)

-- 
2.1.4
