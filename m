From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue,  3 Apr 2018 11:40:49 +0200
Subject: [PATCH v2 u-boot 0/2] reset: Add get/assert/deassert/release for bulk
 of reset signals
Message-ID: <1522748451-21209-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch adds a "bulk" API to the reset API in order to get/deassert/
assert/release a group of reset signals associated with a device.

This bulk API will avoid adding a copy of the same code to manage
a group of reset signals in drivers.

This serie and the "clk bulk" serie is necessary and suggested by Marek Vasut
for the "Add USB Support for Amlogic Meson GXL SoCs" to avoid adding the same
code to manage a bulk of clocks and resets in another driver.
I will push a RFC code to update the other drivers having a similar
code pattern when these patches are merged.

The second patch adds the bulk reset API tests for the sandbox test suite.

Changes since v1 :
 - Add sandbox tests

Neil Armstrong (2):
  reset: Add get/assert/deassert/release for bulk of reset signals
  reset: add sandbox test for bulk API

 arch/sandbox/include/asm/reset.h   |  4 ++
 drivers/reset/reset-uclass.c       | 60 +++++++++++++++++++++++
 drivers/reset/sandbox-reset-test.c | 29 +++++++++++
 drivers/reset/sandbox-reset.c      |  2 +-
 include/reset.h                    | 99 ++++++++++++++++++++++++++++++++++++++
 test/dm/reset.c                    | 33 +++++++++++++
 6 files changed, 226 insertions(+), 1 deletion(-)

-- 
2.7.4
