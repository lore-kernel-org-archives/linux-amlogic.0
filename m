From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 6 Jul 2017 13:29:54 +0200
Subject: [PATCH] drm/bridge: dw_hdmi: add cec notifier support
In-Reply-To: <20170706110553.GJ4902@n2100.armlinux.org.uk>
References: <1499337186-24429-1-git-send-email-narmstrong@baylibre.com>
 <20170706110553.GJ4902@n2100.armlinux.org.uk>
Message-ID: <185aa90b-a1b2-d899-40bb-7d333f584bb5@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 07/06/2017 01:05 PM, Russell King - ARM Linux wrote:
> On Thu, Jul 06, 2017 at 12:33:06PM +0200, Neil Armstrong wrote:
>> From: Russell King <rmk+kernel@armlinux.org.uk>
>>
>> Add CEC notifier support to the HDMI bridge driver, so that the CEC
>> part of the IP can receive its physical address.
>>
>> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
>> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>> Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
>> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> Hi Archit, Hans,
>>
>> This is repost of Russell's patch from his dw-hdmi CEC patchset.
>>
>> Since his CEC implementation will be integrated in the bridge driver,
>> this notifier patch won't be re-posted.
>>
>> But the Amlogic Platform needs a notifier since it uses a standalone CEC
>> controller.
> 
> Without this, the dw-hdmi CEC support will be totally useless anyway,
> and it's pointless to merge it without this patch.
> 

Hi Russell,

While following discussion on your last patchset, it seems you agreed with Hans
to no more rely on the cec-notifier but directly call the dw-hdmi-cec functions.

Anyway, if this patch is merged separately and you still depend on it, you could
still rebase on it when it appears on drm-misc-next...

Neil
