Return-Path: <SRS0=rvs0=Q4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8D4C43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Feb 2019 19:35:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E8632077B
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Feb 2019 19:35:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ihve3WZL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E8632077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RWMuMWnvEgoirFInCVJfkB8vKu3MPV6siX0R+AuhAiA=; b=Ihve3WZLZYtzgr
	33DH4oiAU2im8IX0qUkM+l+AqKrmF6oXMrpMJkAZoJH9e+21PnNAHqFvA0B4cDy7xaYDzd/4yPFmH
	sFYv9VE2cnK4nib9t1EoSpD2SUr4+Mo6keDRHQmvUJl0LukY9VPvcaX3qkZWrwda35+IU7QRhiAQ2
	hRd9M74I7I9l+H9/aC4DnVHK+FbHVjFoNW0BGd3l9/3+lhmbrIVy9mody7ebumXVhpxTuk4IE8ym7
	s/kEk4DgB81xqSAvn6IJ73aNPQJFAdoZDwiJHVbcsY4pUaw/vS1+aAMm+U5X5FFZNMjzp253SsjhX
	sdUfuH/xWnbS+C9QNW4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwu7m-00032g-56; Thu, 21 Feb 2019 19:35:14 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwu7j-00032I-AX
 for linux-amlogic@lists.infradead.org; Thu, 21 Feb 2019 19:35:13 +0000
Received: from [10.10.11.100] ([95.88.214.118]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LiDHj-1hREvP2hff-00nSKG; Thu, 21
 Feb 2019 20:35:00 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Jerome Brunet <jbrunet@baylibre.com>, Jose Abreu <jose.abreu@synopsys.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <c80c1e5b-fed9-25ce-eb1b-258ac0135ce7@synopsys.com>
 <7afdaa0d-d0ef-b223-1f6e-2b52bfa44784@gmx.de>
 <6f25da2b-7f28-b888-3240-7178ac75c90c@synopsys.com>
 <84fb981c-75ab-ef9e-edd6-cd0c52d9dc36@synopsys.com>
 <cd344fa3-758f-3824-ddd3-568ce837c4f7@gmx.de>
 <8bae9cd6-5c44-30e3-bfe5-8d6f853f170e@synopsys.com>
 <065407cd-c13b-e74c-7798-508650c12caf@gmx.de>
 <227be4e9-b0cc-a011-2558-71a17567246f@synopsys.com>
 <45e73e8c-a0fb-6f8f-8dc6-3aa2103fdda3@gmx.de>
 <e1d75e7f-1747-d0ce-0ee7-4fa688b90d13@synopsys.com>
 <4493b245-de93-46cd-327b-8091a3babc3a@gmx.de>
 <adafe6d7-e619-45e9-7ecb-76f003b0c7d9@synopsys.com>
 <cd0b3dec-af3f-af69-50b7-6ca6f7256900@gmx.de>
 <fa35fb4a-b9d5-9bbb-437d-47e8819d0f27@synopsys.com>
 <244d7c74-e0ca-a9c7-f4b0-3de7bec4024b@gmx.de>
 <1426d8ed40be0927c135aff25dcf989a11326932.camel@baylibre.com>
 <9074d29b-4cc9-87b6-009f-48280a4692c0@gmx.de>
 <d7de65c614ee788152300f6d3799fd537b438496.camel@baylibre.com>
From: Simon Huelck <simonmail@gmx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=simonmail@gmx.de; prefer-encrypt=mutual; keydata=
 mQGiBD/bCNARBACE3URTBXZ/AA03NwRNtz03ewQn3uhvYSTjfqgplBtb3dfC4a79BXDRIWVX
 xPGH9Ewios1c8gMu3/RI2l3JzXoISfw5b0L/5igyPKV+sGuUA2FD27kYtPaaF/TqEWIv+Yxp
 9DCjCX5IQSYyvCfcxcyEkY8eVWxnaAlV3zKRR8wn0wCglWIOtAugBcg1YXmoLpFZE8Ca0fkD
 /jG+n4U9DPfCgkbgjQ/dv2W2a0ZDHccA9N8AW/FTXGyXXO0e7ql9/kORJnp7jD7/Z9HCKpeS
 HajgxuX9Vhfx6bH1dAMfsg88+K8pOO9oulNX1+YffQyZWOfdbmnZDUzBt9HKR9Wgh8WoIyw9
 TVluclzn6hYz+z9jbqHWMOsiCu8zA/0apHbW8vaIDT4+nNUxNdqU1TKa9kW47vNjwYYL0jZW
 TXNjDIRpqJVSugYVc/U847GoVoxyvtzre4TAbBV8h0BAOeMdxI5En67RGWzeNaMDJV1bwapj
 qdfj3e/X8rnGIfwz47rwztLNKoAIUlKrATwroiI7UNT+84G7H5qalu+Eu7QqU2ltb24gSHVl
 bGNrIDxzaW1vbi5odWVsY2tAZ29vZ2xlbWFpbC5jb20+iGIEExECACIFAlH7wL4CGyMGCwkI
 BwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEJNSVvfBt05KlBQAn1JDO7e4H3N0WFJkZnxvObhk
 2kiAAJwPdDd6T1TuGo4iDIENRhAX4AH2KrkBDQQ/2wjSEAQAj6JnDDQzIIYzPGsrHRvaq8vw
 n8VrZCbPRvkngGvtQIss5pH/MLeu9jLepDGO9WHByFSg4QJh8cINYwTLtX8Bu0naA6ZI46hn
 GyfxdRlxSU9dRqHpU3G0tymL1w3AER6aVSfdXQTmFgf61anKunbIIptkqzZurkjnxkwCE/RM
 RscABA0D/jhglpj8siSIAxs8XLVfKJrjzbYM9/wS0NfdSXBeQJiYtKrY0WMNsqjY50wDnLMg
 anORN/odT6mCwKI6xChzxEv/ta4+teZl92aitziSuqmtl+jm23DpOcUC7UBz2W1+TvnrhPR+
 MKu8pPKAgsE8AI5uwCcNJx7V3bczYkIGaXybiEYEGBECAAYFAj/bCNIACgkQk1JW98G3Tko6
 3wCfZBpZAUhUz/Rcp2rfg/YSKl4YLlEAoJN7e322OvHc2GQ9n1+tKLi6Og4c
Message-ID: <e009cbbb-e31d-2438-e454-2fa10ebec542@gmx.de>
Date: Thu, 21 Feb 2019 20:34:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <d7de65c614ee788152300f6d3799fd537b438496.camel@baylibre.com>
X-Provags-ID: V03:K1:5t4JU7B6SDdmm2VFjcLJM6Uwi+Ly5wQ5kfXstSbXggOx3/gHL5u
 EV7iyb1ZuupSvWzciy7TfeZTDuBCFARk64bLK9QEbGkpKRbs8MFv7U1wvRsEzPL0zXRvSsP
 JQiF/gU3WLoB1WoyPUdxFRUhrnLHlES/7wILBL73biDhGNw7LbMI9wLAyxbTJipIX3Iz20W
 WvLlfLZQMk74vVk1iQWKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q5aaLSE2j/A=:M1iUIK+lq4DZYWWG74qS19
 cSRg8ZuleHhSnq+gmajcqbZe4hvlsvkvkwUCbOMgPDIFu+ziaejwXj+Ai9l3B9UFugtJUTFaC
 qRX7uBYSQJtmQ7fhy0gTwDpczCrhfwYBIlS7FhBbT1QyF5r/3sC8/sZWRti24Z93HscqDF5vC
 37t1UI1SK7PIjJUJ+Ot8SX1m2ApILYsy/nuKFtgbWM3sPjt9+MSsXyDcH0ryehIFVwASP9F14
 fadKRQ+lNy0RVa0BpL/O2WNu5aBr67vc2RytdYQTrkRLitvSkCRutIR4mSIsIBbjRGo6tTPN3
 k277U96PaIDIRtgil4JyaUdMw1T22tM8mA+ragZwMXIuyxBd6EpOomGR8kLYRkitU/MucfPxK
 XGB/uB+ycKdWOHgZWdisAfqLPAFQku0WgnqfCowWgckU/7cZu6ris9penwtrhjGtZywKuf9LS
 xgCW4BfUdJq9f9iqW61RD+Jv5wFjVMVDZeOLwy2B4zEeACxUaq3VXLc7uwUWK2CUnKHK9TsnR
 slZtyldnDuc5tx5leh0hKkP/eg8nSIg0lHvqc6zsXR1IjPy4KkEblsuNxok1M4fvZRznjYytf
 qy8xSqQTZlx5fJLoL2wi3H5uSv0VY84/ssfO+xVwXk+SNcYqmAzfSZsZmfaM6zgxTAGzc/s/S
 ge4jdg/NS766UVh7dOyqWoEnme7orx+uK/DegcKWNYH7eSkyPNT3NAweLTARbFUTNQz1MX1zn
 YhodJjTMg/71CEk0fbZagdXIZfSJlO6//FLadFGTYjKalKfDwlu1gPTsE5fdM7A3WwHcYZpIa
 w8jC/5Bo0fCjdu1n1HLWM1VwJzZjwYBIxvTqcAi1Id1PjYsJk7jfEVMb60rYNkHLsRjNWvzsV
 MXGpULlJ4gFP52N/CQ70fzmclL9F9HkxRjO+JOfKcduyjAHNa4d6qRcWtJsEG1+vS6CM90NcH
 xoQqjTh/xxA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_113511_667025_CBA5919E 
X-CRM114-Status: GOOD (  13.21  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, netdev@vger.kernel.org,
 alexandre.torgue@st.com, Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Gpeppe.cavallaro@st.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Am 21.02.2019 um 18:46 schrieb Jerome Brunet:
> On Thu, 2019-02-21 at 18:27 +0100, Simon Huelck wrote:
>> Hi,
>>
>>
>>
>> this was changed recently, with a patch for the EEE stuff , see here:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.0-rc7&id=e35e26b26e955c53e61c154ba26b9bb15da6b858
> Hu, I was not aware this finally went through. Good !
> As explained in the patch and by Jose, the GMAC should be using IRQ_LEVEL.
>
> The realtek PHY has EEE enabled by default. Having this enabled generates a
> lot of (Low Power) Interrupts.
>
> Previously, when the GMAC used IRQ_EDGE. Because it is wrong, we would
> eventually miss an IRQ and the interface would just die. Unfortunately, it was
> not that easy find out.
>
> 2 years ago, we just noticed that disabling EEE would make the failure go
> away. Forcing this EEE feature off through DT was merely a work around.
>
> Now that the real cause of the problem is known, there is no reason to keep
> this hack around.
>
> Whether EEE adds a performance penality and why, is another topic.
> As Jose pointed out, you can disable EEE at runtime, using ethtool.
>
> Jerome
>
Hi,



i disabled EEE via ethtool and via the .dtb , but the performance
penalty stays. Kernel 4.14 still gives me the former "good" performance.



regards,

Simon


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
