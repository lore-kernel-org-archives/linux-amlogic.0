From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue,  3 Apr 2018 11:44:17 +0200
Subject: [PATCH v2 u-boot 0/2] clk: Add get/enable/disable/release for a bulk
 of clocks
Message-ID: <1522748659-21622-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch adds a "bulk" API to the clock API in order to get/enable/disable
/release a group of clocks associated with a device.

This bulk API will avoid adding a copy of the same code to manage
a group of clocks in drivers.

This serie and the "reset bulk" serie is necessary and suggested by Marek Vasut
for the "Add USB Support for Amlogic Meson GXL SoCs" to avoid adding the same
code to manage a bulk of clocks and resets in another driver.
I will push a RFC code to update the other drivers having a similar
code pattern when these patches are merged.

The second patch adds the bulk clock API tests for the sandbox test suite.

Changes since v1 :
 - Add sandbox tests

Neil Armstrong (2):
  clk: Add get/enable/disable/release for a bulk of clocks
  clk: add sandbox test for bulk API

 arch/sandbox/include/asm/clk.h | 32 +++++++++++++++++++
 drivers/clk/clk-uclass.c       | 59 ++++++++++++++++++++++++++++++++++
 drivers/clk/clk_sandbox_test.c | 29 +++++++++++++++++
 include/clk.h                  | 72 +++++++++++++++++++++++++++++++++++++++++-
 test/dm/clk.c                  | 38 ++++++++++++++++++++++
 5 files changed, 229 insertions(+), 1 deletion(-)

-- 
2.7.4
