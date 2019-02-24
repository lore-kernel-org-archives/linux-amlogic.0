Return-Path: <SRS0=HZJY=Q7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72309C43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Feb 2019 20:35:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40D7220663
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Feb 2019 20:35:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qITHHSH6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40D7220663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QrOie2EoWFu5MRXMPtvRnydaaUqIaBgpYJDxQk+ee+M=; b=qITHHSH6/TldHI
	/WNPa0ii+VEC1yt7JW+DQjg9Za7J1CRbwWbdJ8+3XVFzoyEKvV9RpmrT/qreIY/nt6d2x5/FMkfHV
	4THTEHkifmtDER6xno+SmHGH01RPGo2m4jaHL466L92NWbOrEaw5/0sXtX57MY8KyoHrpEhyW8Ic+
	q4wLWpoIGyWnTjGaR5+HuBJJd7Q9OExjKkoNgmq3AblNQvoBzG35AotwG5p4ivSAogQDffgb7VkBJ
	aqEVeYrFseMlPFm3JSwKuy01RtIRu/wI+n0/2K8GplwoD+1lcu8r7L7Q0XvqWTopdJFdu3duBbTml
	jSDMlPrOlV2GdKpBlz2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gy0UD-0006ck-6T; Sun, 24 Feb 2019 20:34:57 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gy0UA-0006cT-NY
 for linux-amlogic@lists.infradead.org; Sun, 24 Feb 2019 20:34:56 +0000
Received: from [10.10.11.100] ([95.88.214.118]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0LtIdP-1h8TgV3BaV-012t7k; Sun, 24
 Feb 2019 21:34:44 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Sebastian Gottschall <s.gottschall@newmedia-net.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Jose Abreu <jose.abreu@synopsys.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
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
 <8ec64936-c8fa-1f0e-68bf-2ad1d6e8f5d9@gmx.de>
 <f08f2659-dde0-41ec-9233-6b4d5f375ffe@newmedia-net.de>
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
Message-ID: <3a040370-e7e5-990e-81dc-8e9bb0ab7761@gmx.de>
Date: Sun, 24 Feb 2019 21:34:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <f08f2659-dde0-41ec-9233-6b4d5f375ffe@newmedia-net.de>
X-Provags-ID: V03:K1:eKKjalu/5z5ZnsSOHXmUsp1qVzbxzk7RwZvR/KL5Uda68o1KMwB
 2UvKw0dIq8yWtGlSrNt6LWlDcxq6sNHutKWYyec5okZP8k6VkUkmQgCS9E50+el26q4w+Me
 Aw1XzsK1ImGU4VmboXafYFKzQtT4NK06GCy1gqKPZWrHDgnvCZi0bDKY2x6ACP45ZcUCDtK
 MCYOzi+KjUyBe+ZzLP3HQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hE5pJIbkdlU=:vi9t9GVe8SsEoT2Pcpf5Ek
 1L8rsgvuIYMep1/al/mjWTR0MwDssxkzO30XB24hKu6f+ysJ7mRWa+WSjkaDP0xlVwTTvvywQ
 a0Kw4iEt9VqTW86ZHzhGfWu/Kw3y4ygTaU7CU+D5rgnEHH5meVEO/YQQq8jJ/6CnXAjas8Xw2
 SrRDMVGPCfhlHccHmqnjJyYJLSls0do1vSTbOqU4XSdtjzdnRBsbaxx8XeQzkV8t03aN4R0NF
 p8EtYPImy/XX4PdZ5NHO37xGoz945RDs63lV5rIbWzBQNjmqbHlr52Pbhtd5x9PrCWlhfIKHY
 6p4STAV6g+C+FzGBRaha/QDFmLEIUrsW5J2MDrd0fW01Q8SCO38wqFkmMQJOhJKH1vEtffD9/
 glWpv5VfEy+YMTl7hxJ1gWvI4OZ9G4EgqgDfXw3+h5zWCyWBgIYv3m0Oj6Wgxf3zeDkhCnEkh
 xkgN26o+b15EiUFSyyqsIr/dCqRMzVvflI2zKNS1uDPE2/wfn0cdGQ3Fy0/Mt610BGRKVl0G3
 VtVCbXfSMERfI7NsQe0z+/4sLC4SgGyr9waL9CXtQFj+W2+W4iZb3e72wDImu5Ikc8/OmYSCb
 opKcH7EgTLxa6B7pI4WjiPTxAs83xKjPa6K7sQJ5uBCS1TAw2CfvU71IpRT4Gery+9OTu9/ZU
 nFbBFj0jH3nPZiIPqvSZ8Tbv4mrM/bwmTaYblOBqb9weAC0zmSDQCsizqoKk2ClzK9JaLkgPh
 d7v4zVPYPlDXPK97WmohMkRIcMA6F5aYbEFs33nk2nHeymAl/hJZmnQCAbdxLX0+SwWRGlCqy
 HrynVvH9M2L2EHOfSyn6GWpCGXa4PNYADbOF4MpGAMb4wfBuWgbgzwNbharzX1MEZI85r1zcC
 ZOepS62yEOi9o3wBl1SozO1fP/ZhfoT3mwPwjuszQHndWM2ldnC+NrIPx9FXmGTOx2edZulEJ
 b2yIOpbbADQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190224_123455_069694_C0F8788A 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
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

Am 24.02.2019 um 20:42 schrieb Sebastian Gottschall:
> vice are you talking about? its not your windows pc. if its a ipq8064
> based device or something like that you should look
> on a very different location. this platform like the r7800 has stmac
> performance problems since the kernel clk code for this device is lets
> say "very wrong".
> so alot of clocks arent correct and so the ethernet performance will
> suffer.
>
> i can tell you that i'm able to get 930 mbit on a stmmac based device.
> but as i said. the kernel needs other numerous fixes to get a good
> performance

Hi,



the topic is about ODROID C2 / Amlogic S905X since the start. we have a
performance regression since 4.14.



regards,

Simon


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
