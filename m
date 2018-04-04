From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 4 Apr 2018 10:45:22 +0200
Subject: [PATCH v2 u-boot 2/2] reset: add sandbox test for bulk API
In-Reply-To: <CAPnjgZ0+M8pXpi+YYZReY+hgeXv+XTCDuooxkYYegaXVT_O38w@mail.gmail.com>
References: <1522748451-21209-1-git-send-email-narmstrong@baylibre.com>
 <1522748451-21209-3-git-send-email-narmstrong@baylibre.com>
 <CAPnjgZ0+M8pXpi+YYZReY+hgeXv+XTCDuooxkYYegaXVT_O38w@mail.gmail.com>
Message-ID: <15fe8854-324c-fa49-c26e-eac86ab84f85@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 03/04/2018 19:53, Simon Glass wrote:
> On 3 April 2018 at 17:40, Neil Armstrong <narmstrong@baylibre.com> wrote:
>> This patch adds the bulk reset API tests for the sandbox test suite.
>>
>> Unlike the main test, it also check the "other" reset signal using the bulk API
>> and checks if the resets are correctly asserted/deasserted.
>>
>> To allow the bulk API to work, and avoid changing the DT, the number of resets
>> of the sandbox reset controller has been bumped to 101 for the "other" reset
>> line to be valid.
> 
> Does it need to be 101, or would, say, 5 be enough?

It could stay at 3, but a dts change should be needed since it declares :

resets = <&resetc 100>, <&resetc 2>;
reset-names = "other", "test";

> 
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  arch/sandbox/include/asm/reset.h   |  4 ++++
>>  drivers/reset/sandbox-reset-test.c | 29 +++++++++++++++++++++++++++++
>>  drivers/reset/sandbox-reset.c      |  2 +-
>>  test/dm/reset.c                    | 33 +++++++++++++++++++++++++++++++++
>>  4 files changed, 67 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> 
