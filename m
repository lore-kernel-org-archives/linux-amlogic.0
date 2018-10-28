From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 28 Oct 2018 13:35:12 +0100
Subject: [PATCH 0/2] meson6_timer: dt-bindings updates
Message-ID: <20181028123514.12660-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The dt-bindings don't match the actual IP block implementation:
- each timer has four IRQ lines (Timer A, B, C and D)
- the IP block has internal dividers which use XTAL as parent clock.
  the result can then be used as timebase for Timers A, B, C, D and E.
  internal dividers are (XTAL is running at 24MHz): 24 for 1us, 240 for
  10us, 2400 for 100us and 24000 for 1ms.
- Timer E can use the "system clock" (clk81) as timebase

I'm not sure whether these patches will go through tip.git or Kevin's
linux-amlogic tree. Daniel, Thomas: please let Kevin know if he should
take these through his drivers branch


Martin Blumenstingl (2):
  dt-bindings: timer: meson6_timer: document all interrupts
  dt-bindings: timer: meson6_timer: document the clock inputs

 .../bindings/timer/amlogic,meson6-timer.txt           | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

-- 
2.19.1
