Return-Path: <SRS0=rvs0=Q4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF86C43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Feb 2019 17:28:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEFB42080D
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Feb 2019 17:28:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l5+5GG2b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEFB42080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDrNS8Bi4DnDEPtIGtH24gFbMKi0U0xgnztUox7h9Os=; b=l5+5GG2btCmLQW
	S6beBRGIVk2CYBuOcq89mrLcMO+sS/5qp+1z1IEYfNdOgnN1MOBVEzqrIuGzZQDcI+NGC9ffh733b
	NEasvZMHClIPRN0OFIEReHg61ZQNGeBHZX4mXAvwa1TimYk5v1dCZVc7VPUq2UfOMfTHQJ/HeHFy/
	A27GfnWt951mIe54bPSf6iitlAUcUqJwm4pfmESqoYn9zKymdm+HsoxM8UbH8Y8Yh5YykO3ICOyBX
	ITzJeB60oymafANOWN02zKf5Ssh88P4L3xtWuAXMosTU9G9YKQb6Odo4fA1iTkWXLtedRda5JVqQx
	gn0zbsJedb6I8ECpK+Gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gws8q-00031L-0g; Thu, 21 Feb 2019 17:28:12 +0000
Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gws8n-00030m-54
 for linux-amlogic@lists.infradead.org; Thu, 21 Feb 2019 17:28:11 +0000
Received: from [10.10.11.100] ([95.88.214.118]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0LcBBl-1hMKvr44JR-00jW75; Thu, 21
 Feb 2019 18:27:51 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Jerome Brunet <jbrunet@baylibre.com>, Jose Abreu <jose.abreu@synopsys.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <CAFBinCAJwk5Go4ZEt2cqVKyfeeOxsa-+3pfLpzQo=XNr5u4Shw@mail.gmail.com>
 <2abbf79a-cdff-b6a7-42de-79ea2c6ab367@synopsys.com>
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
Message-ID: <9074d29b-4cc9-87b6-009f-48280a4692c0@gmx.de>
Date: Thu, 21 Feb 2019 18:27:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <1426d8ed40be0927c135aff25dcf989a11326932.camel@baylibre.com>
X-Provags-ID: V03:K1:mCVRh3fDA0b75GN2cvjkdx5kfh7H5QJpoE6KWbEccV0sINBKuaD
 3anGnjp1dOywrgv38qfYnXidEKb/hi8HDefzh9HW9yo8v3OmZNsTdGQz9kyc61FzrsreWQJ
 tfsbUdzvLw+WHoCCH8102KLqfJs3tFkxvtZlS2LbD8Rf+YZfrx0vxmqUnHFqYvl7zAjkhMe
 gLCOdSnkN7EXWftiTLxUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oVupIRVhiZ4=:zOmGly5/lVljSoqrgIo9ry
 hcXhrWHAue5P9ZPzQM6SLAOcoSH38o0Zx3rUpBePMnAO87agtF8XEbLIOv00pD5VJnMfS8J8X
 yfNgNP4JnaeDwZhv5NQr96E+oV+/3V8atkBJyBNjD1Ipt5BjWOV7PMQow+3Mg0L+5a3HeoMOi
 XDDqDFX4/auQEXItEWTdSSIVQ09H1dn2U0DkT78zKZtvF4vaGNLh3937o5jDYSxHB04mmEzsL
 7MAtcixVf5CN6bj9bLy6+UbDFe2+H1s9rnC8+j+dNArCxCoRkXubhC3NLI+cpgTleHvP9A2em
 ws4EPXzgWdxGIWNZq5mgBbTAxe52gLM062fnUjiczEKf43G6mjcgYOperwAXINVCYdeViDgTy
 dkN6Iyq+FiVN670bNnTGkeU7f7urqVEIWAB/zL3IqAWYsBXfvXW6ppMr/OsGE8F2F0W3WwdYA
 USHkMVi/QzbUQxm7/sypXN58YiAlpCMw9CKc2XTgahzrhVmY1LGLNwlqCOTPe429XSaySJ6rW
 pf6iIydvEhA3X+PGFwbVK6gO7UFcDkXhs088DH+QS+BFB10TJRv2Uk081DLLYq/kCeaIdzJlz
 Q1Y2zXxlI6WoF81fyVouZHwng84b8BYeO9vBExFV9hEchTTS1hzN11Cy2WZplG97nggNjSbxq
 datJfnXR5UEJxsW3UA5BVFc9T7YBN48RuBTrjIbstCsUGVtVOAh92ErMRtVmu98bdcepmeA+1
 4KHMwgLN7bys7JDhy1fM/07QcprTsBcfY4Ao9Vdt/4YNqes3tQ06SkEYSJ7khH5iaBgaWjphV
 LsMG2RVR4rgyQqTWlHSbvdXxF4BkFB68s75Te9CL8SWjssm21Hf2chyBGBcFK+d3ycoxSzyIJ
 s6DcZVKpsnmAV1HSoFJyi5v/Ts6aM9o+KhfoFi+pUFpLQpcPAmzc9QvLSDFavD0bPVrB/T7n2
 L90FjjFzSLw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_092809_493906_AC3F9730 
X-CRM114-Status: GOOD (  11.10  )
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
Cc: linux-amlogic@lists.infradead.org, Gpeppe.cavallaro@st.com,
 alexandre.torgue@st.com, Emiliano Ingrassia <ingrassia@epigenesys.com>,
 netdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Am 21.02.2019 um 15:21 schrieb Jerome Brunet:
> On Tue, 2019-02-19 at 20:41 +0100, Simon Huelck wrote:
>> Am 19.02.2019 um 09:47 schrieb Jose Abreu:
>>> Hi Simon,
>>>
>>> On 2/18/2019 6:05 PM, Simon Huelck wrote:
>>>> disabling EEE doesnt help ( did it via the entry in the .dtb / .dts ),
>>>> the results are the same. I can confirm the LPI counters are zero or one
>>>> only after the test.....
>>> It's interesting to see that you have a lot of RX packets but few
>>> RX interrupts. This can either be due to mis-configuration of
>>> interrupt flags or RX Watchdog.
>>>
>>> 1. For interrupt flags you should be using LEVEL triggered IRQ.
>>> 2. For RX Watchdog you can try disabling it by adding the
>>> following in your platform wrapper driver (which will be
>>> "dwmac-meson8b.c", at probe):
>>> 	"plat_data->force_sf_dma_mode = 1;" and
>>> 	"plat_data->riwt_off = 1;"
>>>
>>> Thanks,
>>> Jose Miguel Abreu
>> Hi,
>>
>>
>> are you aware that odroid c2 dts is using level irq ?
> The odroid-c2 (meson-gxl) is using level triggered irq, indeed.
> For a reason that still eludes me, The odroid-c1 (meson8b) isn't.
>
> This is confusing since both boards have been mentionned in this thread.
>
>> at which numbers do you estimage that RX irqs are low in numbers ?
>>
>>
>> regards,
>>
>> Simon
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>
Hi,



this was changed recently, with a patch for the EEE stuff , see here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.0-rc7&id=e35e26b26e955c53e61c154ba26b9bb15da6b858



before that the IRQ stuff was differently. I tried to revert this patch
via git locally, but had no success ( i guess git tried to revert this
patch on the server :-P)


regards,

Simon


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
