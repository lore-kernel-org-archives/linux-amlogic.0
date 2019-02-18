Return-Path: <SRS0=i5j0=QZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0141DC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 16:41:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C57B42177E
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 16:41:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gRD33UwI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C57B42177E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKF+AL2rgytDuL9k6+wDLEQaAz60y14QO9cYVQIvUcU=; b=gRD33UwIXmBVjp
	BgMdNJGVfHU1U1i/9nugJMWpzhc7vxEDxMNBHJPDfIulGL2yV+V8q/SLUtlay6QZwaM5tmRxLq5l+
	FOBc2Jwyha3G2jx2p3Mo9iNgpmwMLt+k2jeSePix7+q5aZkKP20m7oFCBGsv7/HWDy3A3V01j0SGi
	otEWbrk4dbY8SptZZn9/ddft21t7cd7TaZvCvYAIIqOfeWLthEXcOYvY/RznPYf/jXw2rKPuHatWU
	uq6RJ0m2FTOWqTxKc2oD4pv2MJxyDxXB57a9BgiA3Gh9/SSuFBgJla5/xsjqbyG6Jhw6sXtzltPB6
	9nfOZiofZr1yeApqZU0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvlyZ-0002Uc-3H; Mon, 18 Feb 2019 16:41:03 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvlyV-0002UK-MB
 for linux-amlogic@lists.infradead.org; Mon, 18 Feb 2019 16:41:01 +0000
Received: from [10.10.11.100] ([95.88.178.171]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MNO33-1gyH4v3eEj-006xgf; Mon, 18
 Feb 2019 17:40:44 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Jose Abreu <jose.abreu@synopsys.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <CAFBinCDebPOsmrhSXecx48nGWHh7g_OGPbr1Y0M+n_v9Ht91ew@mail.gmail.com>
 <e05b7448-cd95-cdeb-c88d-3a324d5f1ddc@gmx.de>
 <CAFBinCAkXN42piiYsc_Qmuqv0w4dbK86gq10AbZyrB-zKuh9hg@mail.gmail.com>
 <20190206103645.GA2482@ingrassia.epigenesys.com>
 <3001f244-8904-1e89-9595-62a65a7b32ae@gmx.de>
 <CAFBinCB1WUMOmaF6Wmr5HTutrgLOru5CRSnOpUUMMuVzHSa3Gg@mail.gmail.com>
 <330a523a-c1d6-4a99-3287-459096af0330@synopsys.com>
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
Message-ID: <45e73e8c-a0fb-6f8f-8dc6-3aa2103fdda3@gmx.de>
Date: Mon, 18 Feb 2019 17:40:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <227be4e9-b0cc-a011-2558-71a17567246f@synopsys.com>
X-Provags-ID: V03:K1:3pJ2SSRHxvS/tWtfB68hAyYVf0kD9Vv40qbqSdaojnZHvBSmhgy
 o7mtcIQoFRKIdJmkd56OwVT7y3Za9FzcQNoJzufCWGYbb2dj/6/QXmx8lcBCP4WKvNOg6lH
 sRaTrsmuhhOMxjhUPLBaqld6d/FZzh+a2zuy95SHigxkkr0KTBF1ly/thOP/dML7OueigmY
 OB4sbpTVdtQSB70tfH6/w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6A2ABZHVOWA=:Ak9C84WxDWRFnO0MZYtBRX
 J5U3PJfTbXMaWskkVGkLQFnar+/D9aytJcyRl9QWZ4fNSFezRVhvDzRqxw3wjORVnj4lWPBNU
 R86tDeAx+p/xMgDRypEU+jn0C37e1mw6YvhIGykFarvO/JZodH9E03WjFaGizBBiSdsy7EE6+
 30ycC7zJikVtWI9QjhJPAol1F0s8zDdrT0bV4bck2a3h/Io2yhf9uLKg9WXIZKf4kqMDeu+g7
 or55PS5ORwHVC2SBP7h6r6biAsZ9ZoQWy7oD0VRbGH7AExNfjoArxqMQhTU43aeooBFQJf6Db
 d6GqXhjNGu7ZhSFIdFP87NzyxrNv7ZN9m5jAJLA9GSomdt4CvuhqA0x4z0HoA7FEOabyVmSLu
 WnYmtMUmjm34RvAz7TCHzJi/W9glI1QKUiVyuzb1/Bryg2DxL4tU6dT1BZ+V/PTVBsejGNnp9
 Vwgv4ivQAnVvTQF3psSHV6nRvxiXnr9Z9Yw+hOtNiEqlETZfRB3VNYZwj+FRIfYin5XOJlCyY
 +slmRs1GEHiJx6NqvZRlMRzSf2r37NiHLYpIcWSUVmrqJbm1WIpsjtHvAGzCDQ3qnhp8HneXw
 m+j9O7uisyWBko2GaP26xBMF5gM4MxW8tiNL2sHpacwxOPOsAtIeLaCguUwzl4laewO0mYcmj
 1alaU03jE5bJq4UcmZ5GBI8O77qxFuGyLIXg0UTfSVuDYIxRASJM4yw6kHqIQLlMdwvRp8OY2
 AuKjdbM3A1V5IpsN/bvruNfpQxM6s+D+kGooU9APB54DMAWtuce4O5/Dt1ILA6evjxVQiMrrd
 Af+TdJtbyGghGrI4ueE36vv6vCgPOmQpCEuwMW91PoTrIDK6rQkl5CzFt8NLXjjwvQrTrdO34
 NCv6nFkcgb9GU5rJDUksIriqJn732Z4zcK9kIf0VdzjGpBohCEF2Dimos0jNbKgkz7qTUePnb
 tGzenblmYrQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_084100_024338_FAD4B27D 
X-CRM114-Status: UNSURE (   9.74  )
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

Hi,

EEE is enabled for odroid - c2 and should be working in 5.0-rc7 afaik ?

there was a recent patch for this which was added to mainline

regards,
Simon


Am 18.02.2019 um 17:26 schrieb Jose Abreu:
> On 2/18/2019 3:53 PM, Simon Huelck wrote:
>> How can i do this (reset stats) ?
> A simple ifdown / ifup should work.
>
>> The .dtb .dts is meson-gxbb-odroid-c2 from mainline kernel 5.0.rc7
> So, according to your DT bindings you have broken EEE yet it's
> still enabled in stmmac as we see the LPI counters increase.
>
> Try adding a simple "return false;" in the beginning of
> stmmac_eee_init() function and check if it works.
>
> BTW, you still haven't sent any dmesg logs, which can be handy
> and you also shouldn't top post.
>
> Thanks,
> Jose Miguel Abreu



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
