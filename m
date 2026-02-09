Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D78E94607
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Feb 2026 21:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jnVOfxAekzzVbuUQXcm2hw7FUMUt+5W4JjRYWJ3FIDQ=; b=g77QAGnwQcXJcl
	W0GQbLfjwcBbw4tRR5QCJHXcrpnimt2vGC0P/S3UW0sR30ip8ADL3cdi9h92VqYzmTU2DUJt7i/HT
	k8rb517vQ5XtELXUOTVAcOyfJjf2rUk4I96uEpaYYIQexeaBwDy5C4x34LJS8yjUk8aSZ8A6rocjV
	P64Og5gOjTIbKOigP4VGfNus1xqZtjbaD0j/x216mou4yaagypxdCmTeGXWgLmfsAnyGAHRSroJiM
	9GQlCcWolGZxp479kcyQf8fLH3xE201OwpMidOX95/ELfoCOoVWzw0r8ZUDl59E/tgJ8x9HalTwx1
	Kti0ikI1VUAi3lYBCeQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpYoK-0000000G2Ki-0dWH;
	Mon, 09 Feb 2026 21:28:48 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpYoI-0000000G2KO-2VsV
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Feb 2026 21:28:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a102494058so27184435ad.0
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Feb 2026 13:28:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770672525; cv=none;
        d=google.com; s=arc-20240605;
        b=dakaAbz9ENDImTxAc1k4OBrXqqNgOylVuRPf/KSsqYOJ+loW5ZHVFtioYz5CFzidpo
         oScLAwFWhreZe/2J/2h2Uju/VpfNQhrJHIIPKaAD/z1TUKINLZThS6ZqWaJwCV9fsJNj
         rvF/wbh0OKnY4spq7vu9EV/tgDmpavpKnurbo8UvK3xXcN2lVIMnCx3xGWyV69o1dcCt
         rbzbV1+1dmqz1sPz+jfsOyTdswfs9+OhYqvNbHI1jSagnBlju8kKz5/3Rk1frm6RQWTS
         eqCwuLKmN8XqkamPi/osjBJhBzZFaf4jvGU1kEA4P+NX18VjxZy6ZBNfSYf45nHTjvY1
         N5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k5FyOhy1MJGzIJn1ngR3+3z96yOozaG6Ty++CDkfdvU=;
        fh=p3oNlomGiJQPm5f8s/UHfycS/jJbQw9Hh08u/+misDI=;
        b=VHVu2WK/upIcwjaNE632wSX6hqJ4+akO/t6fo8KY09VXVli9R8pMkfw4u6hLg9rAv3
         eV3dg7vdx7XUmZlc73MTCx3JvlCqmY72EYEL0s1fyFGL6QgTdA0hFPjqNjD8dlY/I3tE
         OUoL4XbXS73jEJwG7TqLWGYdp0tKWnDLrQJB12Gra7RK59KBJsc15wZh93tKP8WSMTrO
         Y6y/D0cuDDEBIOIXPUwqYdS2+MuCMw1UNwoXXE8sY/VajWT5AAd/IFJDUVg4092MvsD+
         H+mu4byalsWbjE+8H19/DJw/ZhQLWST3vgZa4fjQducM8hETST1tDeI9cFjaixcDL/sH
         lblQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1770672525; x=1771277325; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5FyOhy1MJGzIJn1ngR3+3z96yOozaG6Ty++CDkfdvU=;
        b=bUA52urM27es2LMqdwAMzMfpTZN3wVS2G+J/txZk615DJ3WRfYnCjWwtEppzB13IOU
         qsI9kQaK9ljKby75NEz1koi0D8SE7Cx0++lnuUuO5BpuOvj2K7L9oLOn59lViTHWjHDq
         R4A3MHgCw3DvvECiEE+JtEvXCflPcX8FtCq+q5a2m3EuKasGdvo0w9TwkWauprAkCDGJ
         gJ34Is5OjQajnN5+II4jDxPkfxgvxScSqV6glBjapeGmb2gwNFvLeiDKoqYFBsMRKdph
         5tTtwGGYWOI8Nt7MRvcIy0GGsJYpGXEkzQ7d9dj5WQCGBu53lwW3oF2J1t1fnVqFOoGU
         Y9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770672525; x=1771277325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k5FyOhy1MJGzIJn1ngR3+3z96yOozaG6Ty++CDkfdvU=;
        b=BsWecqFOodtxsFibf88fxLlNincgWayDwQwLVuyUowcTQ/G3uAERfUDyR/wSoWXntk
         ZRs2Z8aBugmPQjPdykd+7v7ZfNFPLYeVbXo1s1tQPpZvJao69So2j8NNIp9aQ9jGgM9O
         Zy4Ufj19OTey5PrydMHVDNgL2itDaM5VVCvMXSEoL4PkZnWYxIUo7+FNq9nVQTnkpjEx
         lWgUJsi5emK2Utq0lDQg+AZlxRg2GmotAU9dSzILx3AaMKz/Ou/bPgbs4iCFEVFW8e2l
         +YoNgrvlRcMKezIj4q5qzzwdMdFRyKUaepZ4jSBLH2ZubTpxKo+o7v1Pf6Yov/HQTE4s
         30qw==
X-Forwarded-Encrypted: i=1; AJvYcCXwEQ1csdZZVa0wkgPnRYpD6B2FvuTSPKPTJoqF6cvG0yM/vR6uY6zZG0snC6LdfIQ/vlNsIAiPigHzjIM/@lists.infradead.org
X-Gm-Message-State: AOJu0YwmtlHK3kVM5TeQAJgIo5fCLI8zXUzlckiQoZJJeQd5OkfMbZ3A
	W2V0SnGLuuKZdQobffB8H+yzfpm2bkj67Za/lbbhKSQry27MMfxPBvD/czF9MBJNU0tlw9pv/7A
	asMpENMxeM8aqXkPRttH0fNUOHuk6I1ZHiE4A
X-Gm-Gg: AZuq6aLWo5PvLNupG5fofBF30OHSBEV2srbOwyoihPRGATmVwNJRZKFH0KgLTMm3AcX
	97UOnhfclOIvTEI4IoSDLATyVOuEGjYWxPUzc7YBHCznHz+XoLSKBHxGU7Xi3y6D1azjdA5wZC8
	Ta3VVaan8STaV18UqkG5fNU4EcBVhe1pV4LWJCUi3laus37sxUqF9cb4aZeqHSVmL0vlCBZ/1S7
	+9g3NOwyVxsadtFaDFMhbEeBBKE40DVK/UeZhGuSQZF8/91vqkg+j4Y11fQsiZ+utnegjRSg5Vw
	WEZFHFz7W5PT0sp4V3KMCyj1KtNt
X-Received: by 2002:a17:902:c942:b0:2a9:5ac3:a925 with SMTP id
 d9443c01a7336-2ab1005a1ccmr1466005ad.3.1770672525352; Mon, 09 Feb 2026
 13:28:45 -0800 (PST)
MIME-Version: 1.0
References: <20260206-amlogic-dma-v3-0-56fb9f59ed22@amlogic.com> <20260206-amlogic-dma-v3-2-56fb9f59ed22@amlogic.com>
In-Reply-To: <20260206-amlogic-dma-v3-2-56fb9f59ed22@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 9 Feb 2026 22:28:34 +0100
X-Gm-Features: AZwV_Qhsvy9MKoHxeyazUY3RMdma2GB_qfE0DFHV76hqeFYCbzBl5BWm6SyiZlo
Message-ID: <CAFBinCD5ZzjQc6ve-zZJ0MqN-a0rrp6pHYf3X_0ao3MRwi2Jrw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dma: amlogic: Add general DMA driver for A9
To: xianwei.zhao@amlogic.com
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-amlogic@lists.infradead.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_132846_638348_616735C9 
X-CRM114-Status: UNSURE (   6.82  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgWGlhbndlaSBaaGFvLAoKT24gRnJpLCBGZWIgNiwgMjAyNiBhdCAxMDowM+KAr0FNIFhpYW53
ZWkgWmhhbyB2aWEgQjQgUmVsYXkKPGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMuY29tQGtl
cm5lbC5vcmc+IHdyb3RlOgpbLi4uXQo+ICsgICAgICAgLyogUElPIDQgYnl0ZXMgYW5kIEkyQyAx
IGJ5dGUgKi8KPiArICAgICAgIGRtYV9kZXYtPmRzdF9hZGRyX3dpZHRocyA9IEJJVChETUFfU0xB
VkVfQlVTV0lEVEhfNF9CWVRFUyB8IERNQV9TTEFWRV9CVVNXSURUSF8xX0JZVEUpOwpJIGhhdmUg
bm90IHNlZW4gdGhpcyB3YXkgb2Ygd3JpdGluZyB0d28gYml0cyBiZWZvcmUuClNob3VsZCB0aGlz
IGJlOgogICAgQklUKERNQV9TTEFWRV9CVVNXSURUSF80X0JZVEVTKSB8IEJJVChETUFfU0xBVkVf
QlVTV0lEVEhfMV9CWVRFKQppbnN0ZWFkIChzaW1pbGFyIHRvIHRoZSBsaW5lIGJlbG93KT8KCj4g
KyAgICAgICBkbWFfZGV2LT5kaXJlY3Rpb25zID0gQklUKERNQV9ERVZfVE9fTUVNKSB8IEJJVChE
TUFfTUVNX1RPX0RFVik7CgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
