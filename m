Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E930E6FE51
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Dec 2025 23:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EDg6qiU/MsgVLNfj2M0Yw/JvqMmI1Xh5W8F4MorsmkY=; b=XZchQfccgpN6Xb
	GqKGcKmGS0qHOuUfDLKN4MILH7+wJRV1RbG8qxLAOUj+ESfvWcd7MUg33ZRzXYPiFvRr+Z9m5O/PS
	wlDmb9dPo88YMdwH9q1EunVNSwToCJrZj1Pkh/sdLlmZKDC7AQUIiRCCiSfX6OMthaTmJ67U8LtJP
	QykZJ12LKImM0TLulC2AtWx5ss9kyfPUxcx6uWxlCJt/GISfUnWMmtD4Bh8f0T7XSfG2dwyb1Xe0I
	wRas+2jBGHX6WCbjF8ygEcml5w6p6MaXZs+5oh3jSCaaQGI1ZbYwd7UdBdxLmMqbsl6Jh/EFpxj6k
	RAHiDMPu/pDhQbyuvo3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYBVc-0000000GAer-1e96;
	Tue, 23 Dec 2025 23:09:40 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYBVa-0000000GAe7-3yEh
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Dec 2025 23:09:40 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a0a33d0585so51325525ad.1
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Dec 2025 15:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766531378; x=1767136178; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1EjGYP2UGBwtZ05v+i9zGbhr9QL9BrOQBe7XkYsNk8=;
        b=Z8PkvsA1YDf8nJSD921lLbTtXOFS7CnfAMgFWty6vspT5QEzusMxr01u7LTwlQlrrm
         13z+q/AsdhKKjurQc66DTW3ODepSmoUkpPJAI7Grmx9cfJ0f4L4ReZHXn6ybsnrvaBwz
         wJvVEZSCIh54Ltfh8bZrxWdhXscTdiaCjuinV98nBD3QpSnXclRy85HREcA21Dv8qDvP
         sCCqHOcR1IXJw/5klqCxE94s0813y9/zRiVSXCHafPrZfLFrfTQzD4XZp2jZ8JaFqqMw
         l0jG+h3+vVOzUo09gf8qjem2J0YKHosR/oSVd1cYtzAQs+40Lgso48raUWjyhF14uhLp
         UsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766531378; x=1767136178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m1EjGYP2UGBwtZ05v+i9zGbhr9QL9BrOQBe7XkYsNk8=;
        b=biZPRnmloh2tvOir/8zlORkoUunuhlPxnnNxdvkhS8lPGhnNNzWnliSBlQ6dDEZtFE
         rGIfiwEGvILOmxVJYGE9s83MGaI4+oytZGD8ACvVzAuaUIJuEqv9Sd7LVf/0kaA2Kw2T
         5DRg4JFCbUy2PFvfqg04J4XNKYErpytx7YAfwvGSQyYGwtKDaHsev1dYhkUhzCcpKVI+
         lSvfO5/LMYx/yYA3dp0U+oJKlupsx4w2hVvHfDKc8738muZKRE4bighF6g4o+IHHNM1Q
         wLOxYIDk0tcitr8XnRZIYBpXFbqsfig/eURgthImMVNPR5wGftNOvLO3aSxRjXVIbN/j
         eiuw==
X-Forwarded-Encrypted: i=1; AJvYcCVHSGxVLJmj8VFJ5peOELJ65CksGycKaRmkssJcddl1BtMuolZw54xpxVEu/c1ZymMs3SqGD+Gi08GFFi/K@lists.infradead.org
X-Gm-Message-State: AOJu0YwEAhgWyNZv2abBtNoIi3T26tqmXW5vqsXA9O7DxxjZy5Lp7dFa
	j6J9Xxf4bXR+BnMctztiJ7/60Gpn6OCF4Lf+eVNntPKro/W+uKOPDlblQZNHa5ATzwl9v6oWA0q
	gVScOWmZMLm6JBqTusclfqSV3eFWb4mY=
X-Gm-Gg: AY/fxX6DB1LaaOqbcAg9ITJzb844Yw7+LgSVoTrR1+VPJMhSvv0SpRPpO2uLL3Tbda7
	t1aO/G8ZK1xccUY3alHH3Pu2E9r7+foQZnoGsH3pCrMZH3J3Df0C1X83CFVt8TK3u2LCFe5UcQr
	7AIKk6mzk8ZTdxLdW6W4cnXGHyOggH2zmjMx1MafS7ii0+1IraDzzlrnSIBDQpp04xwSEuGAnHw
	SRV3fWAA3g0CWmOC7CXELMLED7SYDy4NptDAwCfNWO3Ktjyx4cKVHMmyHUOJGd8ug5BrFhp+iRp
	y8X/OYVayGGD50xrNz48KoC9FnD3
X-Google-Smtp-Source: AGHT+IFUSCkAfRP0I6/HxdHEcLNE7m8wfG7D21SpknHBGNN89HP7uArZIqvkPs7+jmNig3meugYVG6juaO/qZ6BfIYE=
X-Received: by 2002:a17:903:3508:b0:299:fc47:d7e3 with SMTP id
 d9443c01a7336-2a2f27350f8mr156126155ad.31.1766531377964; Tue, 23 Dec 2025
 15:09:37 -0800 (PST)
MIME-Version: 1.0
References: <20251223152510.155463-3-krzysztof.kozlowski@oss.qualcomm.com> <20251223152510.155463-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251223152510.155463-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 24 Dec 2025 00:09:26 +0100
X-Gm-Features: AQt7F2ryDIpXSRh1nF6x1WRfdFopeDKxRaQNT7WxGxtmZzK7QOKWjATFSuNf3mk
Message-ID: <CAFBinCDRUEKeE1ufjiqX=jr3nrJX6crg-rBVU5DW66WkFA5NAA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: Use lowercase hex
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_150938_983959_F85683B1 
X-CRM114-Status: UNSURE (   6.11  )
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

T24gVHVlLCBEZWMgMjMsIDIwMjUgYXQgNDoyNeKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBUaGUgRFRTIGNv
ZGUgY29kaW5nIHN0eWxlIGV4cGVjdHMgbG93ZXJjYXNlIGhleCBmb3IgdmFsdWVzIGFuZCB1bml0
Cj4gYWRkcmVzc2VzLgo+Cj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29tPgpSZXZpZXdlZC1ieTogTWFydGluIEJs
dW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
