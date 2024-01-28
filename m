Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CC8C47DDB
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Jan 2024 00:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWr6vaozI7KxCAMeJxmP5j2BXc8PxY2xpFbMcdqgvZ4=; b=GMsgNg0Qj1VWmq
	oazrh4TQmVDB/7uceZ3xsaBZ7xhrHrE2dw+f0YiKn3wmYS6o49acr+9dQrEa8A5CDW2wv2xn9DTXY
	1uJO5loqKmYwf5tj1z/GmqHPrF8RCvQ2OtUmdYkx9a7R1sEZiLl1FQCBN2FF79D2DgIq296Q+RTO7
	oDE3p5F2GwZ2JmMVKN/lbmN828oD+bJksla8wtS+7jG1yJjNtMbfV/wFq06QFHxROegiIOPaAGLNJ
	/ghbsEqhLSb/jOr38YmR3jxCWRrozzbMCr3YY2LvUS2jgePkBSwaaufajxiO4vgAD1DqPGNeQbwfQ
	LiLIKFMUmq5UiyT4fDlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTt4b-00000008UMz-2bUR;
	Sun, 28 Jan 2024 00:30:57 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTt4Y-00000008ULT-0LEn
	for linux-amlogic@lists.infradead.org;
	Sun, 28 Jan 2024 00:30:55 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5ffee6e8770so21271997b3.0
        for <linux-amlogic@lists.infradead.org>; Sat, 27 Jan 2024 16:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706401847; x=1707006647; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XeWa9wReTzghX8am264WYPfkFIN/SSiF0UBjGJ3W+k=;
        b=Ctqo2rPcF1GeUeaF47C7teCxs8s8m3BHab//F6vKr8HKMMAnXpwfON/ZbgaYGfTh5Q
         pLqCxUGIHEwBjFyBjLbiO6n9DijkMFRmA+Xv6gFVieyOuYJrwKchxaTED4yQNGWn9jea
         6XY6N7rW0RPX1FInbgiTfs04Ll/RCstWB5nxYM/Rsuzsli8BrRA8HhEUfEUKs2nsHZql
         U/9ZhFSk0WSsmgLdROPJcPap9hWqNHM7j86s4lbKbDyOiJmSu5vqL1V3AOoqEfYK2WSD
         xrtr2abV3WvTY9NThYPRR47RBgf6u4aYtbIBjjcx1OiZcMuoF8Epjk4naCvWs52XfhgP
         sIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706401847; x=1707006647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XeWa9wReTzghX8am264WYPfkFIN/SSiF0UBjGJ3W+k=;
        b=V1hKaC0gg+4j+51KGHTqew/x1PHAfx1fiTuGsNDylgNGwx/h2G6V+tAvU0ianSrweb
         AdIVXtvZXXnyyX535DTEYqwFI3/wIY5P/d4nCpBXf2trZ6NEdY4JQ+gMcm121Wn2je9S
         FHcGrerblX8eRN4cBw73U1iHa5ZNw/q5bCGYG3fLcZbU36jbsftmvLqAuHqmJh50Nzni
         YfN0KCY5hPAVlawjXpF1Ydt9UZEF5xYaymNqtnQeG9G+pdEssbpGPdudNd13mmFeiD+m
         ZfYNiR6dWxuOXJeDvvj9otkc8h0qEbAvB/Xu1ssLQEo8rT47AnKIm3h40oNpKO8O+iLH
         1/0w==
X-Gm-Message-State: AOJu0YxwgPs5PnUu5gq7jSA9DpZgE3MIRhgRIHNtzKuuqzjt3i8leD3k
	HNq95O1wG3wgH9jDanLgeKbGuwxEL3WZhsw26C2CBBFaTfO1tYfhWYcUUXX9b5IsHKb0aXd1fS5
	xDI3+LtCtuJaeOJsr22v/+xFYskI/3VD3D/Ixjw==
X-Google-Smtp-Source: AGHT+IGxs3s4swA7aJvEB7pT6rtvh2/gd0hceFpjYEOEUxrbCgEYQOKDnDUlCO+e5gXGU0buzAnJVxVqviu2TJZaXKE=
X-Received: by 2002:a81:8450:0:b0:603:bb3a:cfc9 with SMTP id
 u77-20020a818450000000b00603bb3acfc9mr1244584ywf.71.1706401847078; Sat, 27
 Jan 2024 16:30:47 -0800 (PST)
MIME-Version: 1.0
References: <20240123083511.21063-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240123083511.21063-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jan 2024 01:30:36 +0100
Message-ID: <CACRpkdaSdB1TZ9qM6YwJTExNMw1W9Rb450kt=6tJLKUixEeDSQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: amlogic: narrow regex for unit
 address to hex numbers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_163054_153934_928C4E8A 
X-CRM114-Status: UNSURE (   7.02  )
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

T24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgOTozNeKAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IFJlZ3VsYXIgZXhwcmVzc2lv
biB1c2VkIHRvIG1hdGNoIHRoZSB1bml0IGFkZHJlc3MgcGFydCBzaG91bGQgbm90IGFsbG93Cj4g
bm9uLWhleCBudW1iZXJzLgo+Cj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgoKUGF0Y2ggYXBwbGllZCEKCllvdXJzLApM
aW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
