Return-Path: <SRS0=5laz=NP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73E0C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Aug 2021 06:52:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81B3761212
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Aug 2021 06:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81B3761212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:MIME-Version:
	Date:Message-ID:From:Cc:To:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Ecy9mEpc0GswkfOVqbTL1DIKaMdZRRDVm9PTJAn6Qw=; b=q4XtegMHNXHvHB
	xqNRvo+kdVHIfpDGoHr7TVpox+rLG4mf10qnzzS6dmeFl8QjtiEeNZM99FX8R8U9OXtMNxGpFN+il
	rBfPxjqfmzxAGT6dJuW6R5uI0k+J/r3TDxhbwnfnluFeA8aDW0sMKfTpQNR6omMerlaxTeBTJkKJU
	kpC5aFzZFicFzU5GhucO2XXKFSNPw2OnVZhSmzJMDSx9JrQ7sSTAdTp061phw+eMOGO5RDwaYuiPh
	cor59lNB1nL3h8bPdPSbt+uf68nzK1l3oJ55iqpyXinbFFF+EoW180DYeTg9F/edxBbMb2JePOQL9
	4a+aSNqt8Urg87oXsd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIQIB-001w2N-V0; Tue, 24 Aug 2021 06:52:15 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIQI6-001w0I-Gs
 for linux-amlogic@lists.infradead.org; Tue, 24 Aug 2021 06:52:14 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210824065205euoutp01f503dd9f97f4a162a11df194c6d1cd02~eK3vR9vBb2037620376euoutp01W
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Aug 2021 06:52:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210824065205euoutp01f503dd9f97f4a162a11df194c6d1cd02~eK3vR9vBb2037620376euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1629787925;
 bh=hOewvhmSLW2lG+mu5+rYxlmwZoHyCa6gXj2IAgjI0cU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ljKUVJP5fZ5S4SC8GBvIeCSXnpBmaZ0gMzo3+wXdz+V8DPf5Asz5DHrxkEr94hElx
 v4+g/C1dmDCANHby90oEczaBH7dLWG1PQPUPcjUs4U8BPvGy2oeRF2t+k5+pnUBzbz
 FNyB+ZP34JzPwO8TLQTazq3gu88dR+hitjJ/mArc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210824065205eucas1p1b87ec04f3ed154fd70073694c8440500~eK3vCFrto0051900519eucas1p1q;
 Tue, 24 Aug 2021 06:52:05 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id FB.9A.45756.51794216; Tue, 24
 Aug 2021 07:52:05 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210824065205eucas1p1b4fffa57afb640bf9e33cb86436ec6f9~eK3ufr0sW0037900379eucas1p1k;
 Tue, 24 Aug 2021 06:52:05 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210824065205eusmtrp15ff9e7aeb101d7a2f43dd80f2a9f4bf2~eK3ueh8GL2568325683eusmtrp1V;
 Tue, 24 Aug 2021 06:52:05 +0000 (GMT)
X-AuditID: cbfec7f2-7bdff7000002b2bc-7f-61249715611e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 09.1E.20981.41794216; Tue, 24
 Aug 2021 07:52:04 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210824065204eusmtip1358d9eda4d304412d70dc61abd014851~eK3tzf3P40183701837eusmtip1R;
 Tue, 24 Aug 2021 06:52:04 +0000 (GMT)
Subject: Re: [PATCH v2] of: property: fw_devlink: Add support for
 "phy-handle" property
To: Andrew Lunn <andrew@lunn.ch>
Cc: Saravana Kannan <saravanak@google.com>, Rob Herring
 <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 netdev@vger.kernel.org, kernel-team@android.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-amlogic@lists.infradead.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <460fcbed-ef4f-2122-3e1f-1517b8d21876@samsung.com>
Date: Tue, 24 Aug 2021 08:52:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSOfvMIltzWPCKc/@lunn.ch>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djPc7qi01USDS4tVbE4f/cQs8X8I+dY
 LWa++c9msWO7iMWC2dwWl3fNYbM41BdtcWyBmEXr3iPsFl2H/rI5cHls272N1eP9jVZ2j52z
 7rJ7LNhU6rFpVSebx+Yl9R47d3xm8vi8SS6AI4rLJiU1J7MstUjfLoEr48lFk4IrghVfTs1h
 bmDczdfFyMkhIWAi8eDEYcYuRi4OIYEVjBK9k0+wQjhfGCXaTl6Ecj4zSpybMJcdpuXT5w4m
 iMRyRomzL36xQzgfGSWuP9jLAlIlLBApcXbfXjYQW0RAQWLKyT9go5gFNjNJHP/+lBkkwSZg
 KNH1tgusiFfATuL/xtNMIDaLgKrEur+fGUFsUYFkiYlPJrFC1AhKnJz5BGwBp4C6RFfTI7Aa
 ZgF5ie1v5zBD2OISt57MBztPQqCZU+LWmadACziAHBeJq+/qIV4Qlnh1fAvUOzISpyf3sEDV
 M0o8PLeWHcLpYZS43DSDEaLKWuLOuV9gg5gFNCXW79KHCDtK/G5/zAoxn0/ixltBiBv4JCZt
 m84MEeaV6GgTgqhWk5h1fB3c2oMXLjFPYFSaheSzWUi+mYXkm1kIexcwsqxiFE8tLc5NTy02
 zEst1ytOzC0uzUvXS87P3cQITFqn/x3/tINx7quPeocYmTgYDzFKcDArifD+ZVJOFOJNSays
 Si3Kjy8qzUktPsQozcGiJM67avaaeCGB9MSS1OzU1ILUIpgsEwenVANT9l877wn1xkJbg7bZ
 L8kr5dK/kyt3+84S86w5OT+upG50bVSe7fN8Vk/O/lyR9L1HTcOin+5jnMXNcc+IOf7It3PT
 NAqtWY/dLdWP/8t0Um9bDcvOhiqbiYtVNhbtPFn/4tE6/gyjLzd4n4QJsN8+V3WC0aXCZ1b8
 zo6d+nWlr/6rnmE4bpLzLau8WML2/jT+zaacD3n0orwU/6d+frqB9RVjg+eFsiJRsQ0TRH7M
 TDwvVHnA+PM6fY2uuxt+KH7UmHy97FzUGaZF/148Om78sOZr9IyXDpsV3395dTDufvU5O631
 r+IFV5p9cPhb8zTmUVXM7k5pj+TTpr/OC369ejnhDO/HV246E2Y+6ZflVWIpzkg01GIuKk4E
 AOF/qzfJAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsVy+t/xu7oi01USDV52WVmcv3uI2WL+kXOs
 FjPf/Gez2LFdxGLBbG6Ly7vmsFkc6ou2OLZAzKJ17xF2i65Df9kcuDy27d7G6vH+Riu7x85Z
 d9k9Fmwq9di0qpPNY/OSeo+dOz4zeXzeJBfAEaVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2Ri
 qWdobB5rZWSqpG9nk5Kak1mWWqRvl6CX8eSiScEVwYovp+YwNzDu5uti5OSQEDCR+PS5g6mL
 kYtDSGApo8T9pTOZIBIyEienNbBC2MISf651sUEUvWeUOPz0DTNIQlggUuL7s5OMILaIgILE
 lJN/WEGKmAU2M0ms2nEGrEhI4D6jxPyl7iA2m4ChRNdbkEmcHLwCdhL/N54G28YioCqx7u9n
 sEGiAskSH04vZYWoEZQ4OfMJC4jNKaAu0dX0CKyGWcBMYt7mh8wQtrzE9rdzoGxxiVtP5jNN
 YBSahaR9FpKWWUhaZiFpWcDIsopRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMwSrcd+7llB+PK
 Vx/1DjEycTAeYpTgYFYS4f3LpJwoxJuSWFmVWpQfX1Sak1p8iNEU6J+JzFKiyfnANJFXEm9o
 ZmBqaGJmaWBqaWasJM5rcmRNvJBAemJJanZqakFqEUwfEwenVAOTLCfLnymubBmLC+Ycqvra
 ZxZoyzs3ckGGn9vvhycqtJeK/1oXueyOWqbK1iXCdz6svaTdr+a+eo7phxMvdn62m/dtBqvU
 9uC1be7la/tum8bY/RaROXz8y8GPWWcTShbPLla29rsUv/uE3UNpnntlv44fMq7802JcvsBl
 d/GCb/INh35bqfEtNPNjmfW2aoGceJEjm0vMpGNbf9wPf2vlz3rR0q9AaLPS+2O2Z54G10nL
 zJER2P5PTjzZRNdt56G9ayXtPgYv4TqpPzcnUyBq0sUr1e1888rjzf5lz+BLWd/awnLu0Iri
 Ca5TTnElBc14vOHasinZe0Wv7E+ftbUtKfJd2KlT9w9vPL3pwLpYByWW4oxEQy3mouJEAACc
 LldbAwAA
X-CMS-MailID: 20210824065205eucas1p1b4fffa57afb640bf9e33cb86436ec6f9
X-Msg-Generator: CA
X-RootMTR: 20210823120849eucas1p11d3919886444358472be3edd1c662755
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210823120849eucas1p11d3919886444358472be3edd1c662755
References: <20210818021717.3268255-1-saravanak@google.com>
 <CGME20210823120849eucas1p11d3919886444358472be3edd1c662755@eucas1p1.samsung.com>
 <0a2c4106-7f48-2bb5-048e-8c001a7c3fda@samsung.com>
 <YSOfvMIltzWPCKc/@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_235210_891702_1F21EC77 
X-CRM114-Status: GOOD (  19.14  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Andrew,

On 23.08.2021 15:16, Andrew Lunn wrote:
> On Mon, Aug 23, 2021 at 02:08:48PM +0200, Marek Szyprowski wrote:
>> On 18.08.2021 04:17, Saravana Kannan wrote:
>>> Allows tracking dependencies between Ethernet PHYs and their consumers.
>>>
>>> Cc: Andrew Lunn <andrew@lunn.ch>
>>> Cc: netdev@vger.kernel.org
>>> Signed-off-by: Saravana Kannan <saravanak@google.com>
>> This patch landed recently in linux-next as commit cf4b94c8530d ("of:
>> property: fw_devlink: Add support for "phy-handle" property"). It breaks
>> ethernet operation on my Amlogic-based ARM64 boards: Odroid C4
>> (arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts) and N2
>> (meson-g12b-odroid-n2.dts) as well as Khadas VIM3/VIM3l
>> (meson-g12b-a311d-khadas-vim3.dts and meson-sm1-khadas-vim3l.dts).
>>
>> In case of OdroidC4 I see the following entries in the
>> /sys/kernel/debug/devices_deferred:
>>
>> ff64c000.mdio-multiplexer
>> ff3f0000.ethernet
>>
>> Let me know if there is anything I can check to help debugging this issue.
> Hi Marek
>
> Please try this. Completetly untested, not even compile teseted:

Nope, this doesn't help in this case.

> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 0c0dc2e369c0..7c4e257c0a81 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1292,6 +1292,7 @@ DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cells")
>   DEFINE_SIMPLE_PROP(leds, "leds", NULL)
>   DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
>   DEFINE_SIMPLE_PROP(phy_handle, "phy-handle", NULL)
> +DEFINE_SIMPLE_PROP(mdio_parent_bus, "mdio-parent-bus", NULL);
>   DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
>   DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
>   
> @@ -1381,6 +1382,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
>          { .parse_prop = parse_leds, },
>          { .parse_prop = parse_backlight, },
>          { .parse_prop = parse_phy_handle, },
> +       { .parse_prop = parse_mdio_parent_bus, },
>          { .parse_prop = parse_gpio_compat, },
>          { .parse_prop = parse_interrupts, },
>          { .parse_prop = parse_regulators, },
>
> 	Andrew
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
