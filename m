From: yixun.lan@amlogic.com (Yixun Lan)
Date: Mon, 23 Apr 2018 16:12:29 +0800
Subject: [PATCH] dt-bindings: reset: fix invalid SPDX license identifier
In-Reply-To: <alpine.DEB.2.21.1804230939350.6136@nanos.tec.linutronix.de>
References: <20180423152907.5113-1-yixun.lan@amlogic.com>
 <alpine.DEB.2.21.1804230939350.6136@nanos.tec.linutronix.de>
Message-ID: <2b97cdb5-6cd3-34fc-17e9-4df8cba82850@amlogic.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Thomas
	
On 04/23/18 15:45, Thomas Gleixner wrote:
> On Mon, 23 Apr 2018, Yixun Lan wrote:
> 
>> This fix invalid SPDX license indentifier, also move it to
>> first top line according to documentation.
>>
>> Link: https://lkml.org/lkml/2018/4/22/713
> 
> Please do not use lkml.org links. lkml.org is not always usable. Use;
> 
>  https://lkml.kernel.org/r/$MESSAGE-ID
> 
> instead. So this would be
> 
>  https://lkml.kernel.org/r/alpine.DEB.2.21.1804222108120.6136 at nanos.tec.linutronix.de
> 
> The reason is that kernel.org is very likely there as long as the kernel
> exists, but random archives can vanish, change their URL, etc. The above
> address is a redirector to the marc archive, but if that vanishes or stops
> working the redirector can point to some other working archive.
> 
oh, never know the difference, thanks for the info

>> Fixes: c16292578ffa ("dt-bindings: reset: Add bindings for the Meson-AXG SoC Reset Controller")
>> Reported-by: Thomas Gleixner <tglx@linutronix.de>
>> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
>> ---
>>  include/dt-bindings/reset/amlogic,meson-axg-reset.h | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/include/dt-bindings/reset/amlogic,meson-axg-reset.h b/include/dt-bindings/reset/amlogic,meson-axg-reset.h
>> index ad6f55dabd6d..4a8e52f68fb7 100644
>> --- a/include/dt-bindings/reset/amlogic,meson-axg-reset.h
>> +++ b/include/dt-bindings/reset/amlogic,meson-axg-reset.h
>> @@ -1,3 +1,4 @@
>> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
> 
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
> 
thanks, I'll update



Yixun
