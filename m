From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 17 Apr 2018 09:34:18 +0200
Subject: [PATCH] reset: fix bulk API when DM_RESET is disabled
In-Reply-To: <CAPnjgZ3SY1DV4XUz6KZMhngAKkSq82WFzs0f-vubgMap4XOqJQ@mail.gmail.com>
References: <1523520199-12341-1-git-send-email-narmstrong@baylibre.com>
 <CAPnjgZ3SY1DV4XUz6KZMhngAKkSq82WFzs0f-vubgMap4XOqJQ@mail.gmail.com>
Message-ID: <c43b9188-2a6d-c433-a977-112cc9c0fb58@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 12/04/2018 18:41, Simon Glass wrote:
> On 12 April 2018 at 02:03, Neil Armstrong <narmstrong@baylibre.com> wrote:
>> In the commit "reset: Add get/assert/deassert/release for bulk of reset signals"
>> the disabled reset_release_bulk() and reset_get_bulk() used the wrong
>> struct clk_bulk instead of struct reset_ctl_bulk.
>>
>> Fixes: 0c28233903b5 ("reset: Add get/assert/deassert/release for bulk of reset signals")
>> Reported-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  include/reset.h | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> 
> We don't have build coverage for this at the moment I suppose. It
> would be a bit of pain to add that with sandbox, although I wonder if
> it could be done with some horrible #define hackery in a C file that
> includes this header?
> 
> - Simon
> 

It could but it will be horrible indeed.

Neil
