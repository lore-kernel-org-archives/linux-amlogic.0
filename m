Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E53C2D0D1
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2024 08:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yO0LMcQ3qUcmfUfz0/3u05YT6g04MF7BPTK48I3jlAU=; b=vdlsRTSWjhGNTQ
	CxWd6MBIjgmwXT3mSRkXl8gYrPzM390wGlxZlTFuDiZ/2Z46HCCjTgave2rucktBNWru1mr5Vy77M
	UHkyqsoJBW0QNTmETWI3XwHF4Oc09Z8uV1HorIpMheyC/NrhqV4xcAA/AYKNlXdBfyTjnkOySdOS2
	jXD7o02igrsiFb0H/ew1b/HUeoPSlZLVa/F1M1NqA/7w1iQ0RIad8AeB7p1dmMh7zKogqJ6JAq83N
	voNOqMaJbwPZtczm6m8iQR6JCvcmxntAAAHogg6b1U10IHW1lk2HyOuN0TTCfO+9G1gawH8L6AZEK
	WxhM2lVcpjhIFxgNYi1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLex1-0000000G0mZ-1h9P;
	Mon, 24 Jun 2024 08:21:23 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLewu-0000000G0jb-2bEd
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Jun 2024 08:21:18 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ebeefb9a6eso43720611fa.1
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Jun 2024 01:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719217275; x=1719822075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5VAOdkKdhcM8gT/1OHnhyjoCTyfpHHr5f/6gNRJOW8=;
        b=U34sNYkkWg53XkWEIM54L6pgGYy0z/VMJlUBKq7ANZFYAphWrLWi4Cp2wMNM/VbEkO
         l5u0YGy7BMSiCIo9gnOvRC9tJld1vg3TJSOZ6jU2+h52LWjmdL3zDzRqho6tuwu3rxXf
         pzkFIXj5Tb2eBXvkteHfhGM5UyNdpRWaqrsrnKMse4wLt3XgwucSsXhAV/Gcru+VkIL7
         dviGimq6Yt1kltnf2T22Rh/IQvbONge2L9+N503WdhHOrEFZAf01C6zvwVPvKX/elmhO
         Kcj4bDyQrXnMqUOSX2XtUm899pQwfY9aHJ8xwbr5vUTcPf8Kw7lSN09p8zm3CgIhDkct
         fpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719217275; x=1719822075;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5VAOdkKdhcM8gT/1OHnhyjoCTyfpHHr5f/6gNRJOW8=;
        b=LCRLnF17wPB+B2sGYgzGMHKRj+ySOlKuQHpZOIElEY03PYMh3c4P7yvGyrPXqgzW8A
         q1yNKfR1G8ajhfmaWdGp4FQDEz6nVzLP9otyMMaA370QH3nnPuV60AzePqWFtaBwPVAN
         1e06MS8IKa2etzgCWCzxY3lLrXBzzDqyWW9r6rqsE/zm30ibd+ckBRFjEsmxRrEwLa8g
         MljGjA7b6Q/MO1kOTwEzKlmt+Y3C4y9MkwjZlqE1MSGGi2AImTF0OM0fWaxCeTfPG30D
         50hCJ7AkGMC5SVnJYG8NDrwvtH9ifAaEkkyqIDqu8bKr++wupugWHBlEYxoICbAFNQjt
         aZxw==
X-Forwarded-Encrypted: i=1; AJvYcCUoIUKeTedra39k254Rr9oDUQRe7iEwor1IRfqc7VpERm9wZHtLTJXERwZ/Yx2H5bfcoc5vkg4s08zOGpa54eKicF/+JA9fBshfodlu+oKbpGU=
X-Gm-Message-State: AOJu0YzsJgX2nCNPf28SQbF+yg+wg4tNZmebaTw2Yshxdo78f002M9Cw
	e1GHCu+8I+8VUhbTXvvcTcSNLdkqgr33bw4M8fsSbkXMm+oqvpuYMOr7Z5A9yYkW+YzcAe6ylO7
	162d2Rw==
X-Google-Smtp-Source: AGHT+IFOM1tvmn28vCqfxsQmam8sAFtMLs0nKzQtQ0TNetL1dlK2e9z8H40izII7f+ZCOzp5EYKRJw==
X-Received: by 2002:ac2:5617:0:b0:52c:b606:2b2 with SMTP id 2adb3069b0e04-52ce0673b84mr2508868e87.46.1719217274315;
        Mon, 24 Jun 2024 01:21:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248179d8e0sm132450205e9.3.2024.06.24.01.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 01:21:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>
Cc: Emanuel Strobel <emanuel.strobel@yahoo.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240622140112.2609534-1-christianshewitt@gmail.com>
References: <20240622140112.2609534-1-christianshewitt@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: add dream vendor prefix
Message-Id: <171921727347.3499124.419809659570327061.b4-ty@linaro.org>
Date: Mon, 24 Jun 2024 10:21:13 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_012116_696959_AC254978 
X-CRM114-Status: UNSURE (   9.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Sat, 22 Jun 2024 14:01:10 +0000, Christian Hewitt wrote:
> Add a vendor prefix for Dream Property GmbH
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[1/3] dt-bindings: add dream vendor prefix
      https://git.kernel.org/amlogic/c/4132d13bfcdb3551b0d1a6a74e2063351b4bfcaa
[2/3] dt-bindings: arm: amlogic: add support for Dreambox One/Two
      https://git.kernel.org/amlogic/c/96cf7ca12bdcd44fcfdca74e56389c40ae47a7b1
[3/3] arm64: dts: meson: add initial support for Dreambox One/Two
      https://git.kernel.org/amlogic/c/83a6f4c62cb12aa902043fc1910fdbe483193f3c

These changes has been applied on the intermediate git tree [1].

The v6.11/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
