From: sjg@chromium.org (Simon Glass)
Date: Wed, 4 Apr 2018 01:54:00 +0800
Subject: [PATCH v2 u-boot 2/2] clk: add sandbox test for bulk API
In-Reply-To: <1522748659-21622-3-git-send-email-narmstrong@baylibre.com>
References: <1522748659-21622-1-git-send-email-narmstrong@baylibre.com>
 <1522748659-21622-3-git-send-email-narmstrong@baylibre.com>
Message-ID: <CAPnjgZ1bxgpoaxkNxnEQ0Sh7Cg2XrbmjC=Da2fCs1nfbf5VuEg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 3 April 2018 at 17:44, Neil Armstrong <narmstrong@baylibre.com> wrote:
> This patch adds the bulk clock API tests for the sandbox test suite.
>
> It's very similar to the main test but only uses the _bulk() API and
> checks if the clocks are correctly enabled/disabled.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/sandbox/include/asm/clk.h | 32 ++++++++++++++++++++++++++++++++
>  drivers/clk/clk_sandbox_test.c | 29 +++++++++++++++++++++++++++++
>  test/dm/clk.c                  | 38 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 99 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
