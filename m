From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri, 20 Jul 2018 14:59:48 +0200
Subject: [U-Boot, u-boot, 2/2] boards: amlogic: Add FriendlyElec NanoPi K2
 board support
In-Reply-To: <20180720123526.GJ11755@bill-the-cat>
References: <1529938217-4196-3-git-send-email-narmstrong@baylibre.com>
 <20180720123526.GJ11755@bill-the-cat>
Message-ID: <f82de347-9aa2-189c-721d-7ea1f9a8ca5b@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Tom,

On 20/07/2018 14:35, Tom Rini wrote:
> On Mon, Jun 25, 2018 at 04:50:17PM +0200, Neil Armstrong wrote:
> 
>> From: Thomas McKahan <tonymckahan@gmail.com>
>>
>> This adds platform code for the FriendlyElec NanoPi K2 board based on a
>> Meson GXBB (S905) SoC with the Meson GXBB configuration.
>>
>> This initial submission only supports:
>> - UART
>> - MMC/SDCard
>> - Ethernet
>> - Reset Controller
>> - Clock controller
>>
>> Cc: Yuefei Tan <yftan@friendlyarm.com>
>> Signed-off-by: Thomas McKahan <tonymckahan@gmail.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> Applied to u-boot/master, thanks!  But please note:
> CHECK: Alignment should match open parenthesis
> #277: FILE: board/amlogic/nanopi-k2/nanopi-k2.c:48:
> +               len = meson_sm_read_efuse(EFUSE_SN_OFFSET, serial,
> +                       EFUSE_SN_SIZE);
> 
> A follow-up when you're in these files next would be appreciated,
> thanks!
> 


Ok, I need to do a cleanup of all these boards anyway, will fix this in the same time.

thanks,
Neil

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: OpenPGP digital signature
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180720/0bb6223c/attachment.sig>
