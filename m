Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C9CC43334
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jul 2022 11:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F36xBfB3hIGw5x2t5VPGJlRLO7TTU/KxiOOeTPvupx8=; b=lmHI7l2slaPkhB
	J+rGZ46oCqDHnKEALyYJko2af4oQ0vGtXkO8OG48k5UPOEWeYRDvttA94QyYK53cbBNEpz9f2rORN
	J3KOb0t/ZUrgs0LL/e2989LKlcnq9NFSzbhEpDW+uvmH1d3AorOkBufUMOUZLPsRi+6dECEsfKULM
	UHCqYTpJplRb5aE9wT6cRyeUhF+xE6rz/at3mr+2q2Rrv9tciAy/m3T9zrjexDQCQWmcc7jTaA+NV
	a3zfjYR8S5f4J6ZuowkfPN/tmnjB51lg4gfXGgij9tM7BjJLGreWk5H4quZTxiCs/zeWTo1LfCbrU
	FC8Bf0DvEHQ24A8H9aIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8KIU-007m8q-Lq; Mon, 04 Jul 2022 11:31:22 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JnD-007LoY-4J
	for linux-amlogic@lists.infradead.org; Mon, 04 Jul 2022 10:59:04 +0000
Received: by mail-wm1-x32e.google.com with SMTP id bi22-20020a05600c3d9600b003a04de22ab6so5431139wmb.1
        for <linux-amlogic@lists.infradead.org>; Mon, 04 Jul 2022 03:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LLYbxrZtIqfELBGb4abToz3pncc8eBo0EcrsRbqn6h4=;
        b=E/BApPeUVGI9ICTP2Guwsd/BSF96qPqrw1LrbDKXmQPx/xE/ig3iSHH9yjwSQxCQF6
         TaS750DYCNsRX19zIOvD18HYg3dfm4i5FDtgweNj3a/ksI81HJL45czbU9wn43ICs4EH
         t7hc0LvBEJebbUgPC09uNlHHUlhWkrIkGu5Fr7IMhV73OjrwyI5AS02uZcMK6fOnWLM4
         NHz2ZOHg2R117kAr3iK/paeworG0WrP3zxmacu7l7DV/i08n5lFCuBuSDxmf55ZVqdIw
         8x7wwugGuGfunM0S7iaZR5PT8+W1o8t8cG/VJRyegt4ZjqcqqUdJOANn9lel30jnx3NL
         yo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LLYbxrZtIqfELBGb4abToz3pncc8eBo0EcrsRbqn6h4=;
        b=wJ6PrDlU5XjlQfznCYmKNnt5SN01clRSfD6AJghj5TJj8YP1qQJedQPlJrDNjYIrrk
         JX3T1JUoU/G5p3hvWuN9g35HelwxBMu3t9zFIGWmly51oCtaw8MA7GPn6uZa+mYXqqoH
         wzHB63Hf3ScoXXR5AmPJh/oWW7zJ+4WuOXXbkSXby4kKHrdgGCe8yCR15oTAKvtiAiU0
         6Mn2Pl3o+brpR6l1gZHxYCQSYS7qDiqcdlpe77RccQ/bPpKfMpG9pmJsJv/noRwdNjfP
         q64ytZgT++NXieFVZODcMbyhWYxQATXBuAFge18X1vbziebFa+TiWmlezX0sstxENWWy
         KUBQ==
X-Gm-Message-State: AJIora86/PC6fwGSLJBx546usQkzNGoNil3GmZT2TjJVPjZF3S3qi7V/
	NlU5z3vIJsRLa3S1PkpKCq+ONg==
X-Google-Smtp-Source: AGRyM1sVgWrqJrM6Wz6XZqjJEMcIpjkNMYwcvTKHCtG3UbEwjJ7tiIlfsNRw9XaVGLgoWIX0Xt0YsA==
X-Received: by 2002:a05:600c:203:b0:3a1:9726:ad85 with SMTP id 3-20020a05600c020300b003a19726ad85mr11247742wmi.180.1656932338677;
        Mon, 04 Jul 2022 03:58:58 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id x2-20020adfdd82000000b0021d62e30a62sm5901474wrl.50.2022.07.04.03.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 03:58:58 -0700 (PDT)
Date: Mon, 4 Jul 2022 11:58:56 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Fix spelling mistakes in documentation yaml
 files "is is" -> "is"
Message-ID: <YsLH8EOwVG+oqFGS@google.com>
References: <20220704105307.552247-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220704105307.552247-1-colin.i.king@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_035903_182883_372BC748 
X-CRM114-Status: UNSURE (   8.13  )
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

T24gTW9uLCAwNCBKdWwgMjAyMiwgQ29saW4gSWFuIEtpbmcgd3JvdGU6Cgo+IFRoZXJlIGFyZSBz
ZXZlcmFsIG9jY3VycmFuY2VzIG9mIGR1cGxpY2F0ZWQgd29yZHMgImlzIiBvbiB0aGUgZG9jdW1l
bnRhdGlvbgo+IHlhbWwgZmlsZXMuIEZpeCB0aGVzZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDb2xp
biBJYW4gS2luZyA8Y29saW4uaS5raW5nQGdtYWlsLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hcm0sdmV4cHJlc3MtanVuby55YW1sICAgfCAyICst
Cgo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3RpLGxwODc1MjQtcTEu
eWFtbCAgICAgICB8IDIgKy0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21m
ZC90aSxscDg3NTYxLXExLnlhbWwgICAgICAgfCAyICstCj4gIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZmQvdGksbHA4NzU2NS1xMS55YW1sICAgICAgIHwgMiArLQoKQ2FuIHlv
dSBzZXBhcmF0ZSB0aGVzZSBvdXQgcGxlYXNlIENvbGluLgoKLS0gCkxlZSBKb25lcyBb5p2O55C8
5pavXQpQcmluY2lwYWwgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJv
Lm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86
IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
