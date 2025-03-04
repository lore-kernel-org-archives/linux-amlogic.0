Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135EBC021B8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Mar 2025 09:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SG2feuo9Z/7lKAiHWZOUO27ZmNtjeS61TveD3+ijzd4=; b=ctXgXJ0p8npKxi
	CBtD84xipDbRrEGYflZj/akxdzFrcyzZBU5MKwPR67DVq6yMgkXJ0XXA90ZDDFTkCTeCkqoOSUbAf
	C7DGCZcmCrPcG2ZYehGTqh0AFcGzJjq1FcMDv6AY/o/cN1wUP1oIATGeuG+5jZ7UTtmwPeOa3oyqO
	g1Vh2B/Pq2i+v7M21tcoi6LQhxc08RUjMShtRAsLOU9sby1GTVtQHF8fi/jTYTrWONaV29+SSnHDz
	Jd0R47ZicE1G0rfORmijEyHrsr/Sm0aZxQNNZ0WmIHlvX0a5tXcRSO0ptxET7pRFafIsR6BT0U+TG
	lmszsu55houkouY8jURg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOpM-00000003xUQ-4BqT;
	Tue, 04 Mar 2025 09:44:41 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNnn-00000003gCf-0BaI
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Mar 2025 08:39:00 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6ef60e500d7so43965587b3.0
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Mar 2025 00:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077538; x=1741682338; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYX5W2qo0J6KDJGUHsyIA03NeMoxJ75oq5Jqbs0b/UM=;
        b=NdSGQsP9Aok5/rYtO74VihjWQBUzSyqwkhczoXtxaT0BhB+l0VPHJ+ubepl4PLQHpV
         kPI2OphHxHi678P/ZuGcfsWDfoEMbAK689qZXoJv7RRPda5okqnEHzrqhFGwudIZIioR
         hEjOzex7xEWgU1dSHlPqWa3tYCBsctxyY2GsG1TkSxByc8vaPpgKnn7qYQwbcP/QNFsU
         bOIb5CSzd8ep0mpFGeuTy4zmDVpDLIvjQBVTcqWSFNUh9THFGENk3hmeWxZRqno5jenM
         oIf/XY3VBAalywapV4VrfTwxw0aFqGc8XpNnY8HDMZzW+vS/jMapjvVKJBg0vN/2t94H
         YBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077538; x=1741682338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZYX5W2qo0J6KDJGUHsyIA03NeMoxJ75oq5Jqbs0b/UM=;
        b=PJVsIre/nZ9GaqF1hHUMsvIk2Uug2kLBUGKSBNW4sh+s1n4KOLjwGq2IqCCI195uxg
         cEge3rZZ8Mq7XhEU+iDqUK97rzgoLLSl1QOqzVcdZFANDjIMnYVpHZ7PEM0U8u7UliuK
         J6eZPNgf0g7klx7Z9/X7shcofIVK3uTJNItt/VHCaj/qOCLra4i8mEfLrOw4kGqRnciY
         NKOuJV/ye28l6HFtXokUvc6C+8miu1p2wbMvMvu3QusniG6DudPitMzzQURwEEzXZWDD
         Q8um6o70TiEQp/Fi7vtGQBtel/TxmNc2J34PAUU/KA0qYXjvKJ7Ox6WZqXLfCGBIHY+S
         650g==
X-Forwarded-Encrypted: i=1; AJvYcCXNvW8DFbnEX5XSM1iA2RJifdEfLSnWK2dTPPv3tFYaAHK0xneH5bwPWbkDtVen0ajHZ+fXRQPk71EV88Qg@lists.infradead.org
X-Gm-Message-State: AOJu0YxLzVgUS+oTLUYVQOri1uFp8Z4gwqetvb3pLjEPNt+B+ot6L2nJ
	4KWKDb/s9ecocE9dmHBg7N8M0C79EJX8/axG04OKkbE+fOL77vgT+q7F7+3p+sFDBVZbzmijoPU
	Nm3jrknzlEc9r8Pg66fCzlg9DkXosJjnQuZv8nw==
X-Gm-Gg: ASbGncu0ycuxbSy0S3cQYpCle62Rjkp11ua07mBbOAGq8NFtcrmmIXwut6xVgAlue2D
	q10yDZA0DnfwSSCcME3UFUhAnBGWWaVv2lZR4vptk9PvRc0YpGdW2qdV2bNI61LshT7pqPvjWOa
	sxbvMxRmSU5b4QIEuD55cTHLz7nQ==
X-Google-Smtp-Source: AGHT+IFZecsTbEQv8yIQnDTe4qYQxuFWKRYt90hdWjp7tqPlhx0s31g1I22yMpbTlBlWL9JWo4wt1mjIhLHqe4o98d4=
X-Received: by 2002:a05:690c:3341:b0:6fb:a4e6:7d35 with SMTP id
 00721157ae682-6fd4a064164mr198940787b3.9.1741077537823; Tue, 04 Mar 2025
 00:38:57 -0800 (PST)
MIME-Version: 1.0
References: <20250303-fix-a4-pinctl-v1-1-6579888b4272@amlogic.com>
In-Reply-To: <20250303-fix-a4-pinctl-v1-1-6579888b4272@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 09:38:44 +0100
X-Gm-Features: AQ5f1JrqMzIuFFtin-kj4LskcpP2GXBY5HqPRMPuqc5yJUWCwELNnJQsuIXOkVY
Message-ID: <CACRpkdbbD6wLp1-m8WMnW68stz6U5GhxbJxcKAThYXWnH00u1Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: fix pin input property for a4
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_003859_087953_6F8F05CF 
X-CRM114-Status: UNSURE (   8.49  )
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

T24gTW9uLCBNYXIgMywgMjAyNSBhdCA4OjUz4oCvQU0gWGlhbndlaSBaaGFvIHZpYSBCNCBSZWxh
eQo8ZGV2bnVsbCt4aWFud2VpLnpoYW8uYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cgo+
IEZyb206IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+Cj4gVGhlIHJl
Z2lzdGVyIG9mIHBpbiBpbnB1dCBhdHRyaWJ1dGUgbWVhbnMgdGhlIG9wcG9zaXRlLgo+IHZhbHVl
IG9mIHJlaWdzdGVyIG1lYW5pbmcgaXMgMSBmb3IgaW5wdXQgYW5kIDAgZm9yIG91dHB1dC4KPiBT
byBmaXggaXQuCj4KPiBGaXhlczogNmU5YmUzYWJiNzhjICgicGluY3RybDogQWRkIGRyaXZlciBz
dXBwb3J0IGZvciBBbWxvZ2ljIFNvQ3MiKQo+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8
eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgoKUGF0Y2ggYXBwbGllZCEKCllvdXJzLApMaW51cyBX
YWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
