Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27ACC36017
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Mar 2025 07:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IuKrFAP6WnHyVQ4WrGsMYocGAbE3+I/C5yTSRgQlS8o=; b=JcPmdhu+nnKD0G
	D4Wvv9Mi/jsUun+PtGptClsLzmlfw2MQmoVReYmYFGs11PPsjxO6jH5xiqbL+yOhXaC6Da927yhS+
	87rw1TiKSkqGnwKjEETE+EBcb98Zmpq8/8PSHKY8ckEDnrLDs3RuuQzL8qohwKzCaHsYfmYYm2d2i
	n5e+gUMzi1o7vRpLDebJsk9jwE6IyMzCRpenx2KrI6k5i2tAwXv58CE53B8m/hgHyKnCBDAK6Y36t
	0wLFWF0FHjsHk2U8tq1fUPCKLqCHZpv3t1Z/TOiizbqJWzY8rd2pzpTE8RrfD/O1OjKVvOJlE/u58
	wFtKd8wPwVd6NEGmSyFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9Bu-0000000H9rC-3zsx;
	Mon, 31 Mar 2025 07:04:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz99S-0000000H9Uv-2Zyv
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Mar 2025 07:01:44 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso30398205e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Mar 2025 00:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743404501; x=1744009301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0EIRXaMi7x8XYwlCWwiW2XCs1AbE7FrNvdFZNLIYyY=;
        b=b2QttzZ4K6HC7SlpUnt1JEcvoMZRirwU27B8HGRWvfoFkbUmAKNayCZ+ilEr21cb8s
         0om2VlnSWRjts+sUHq29zGJDrZqb0998O+7EP0Ly7IYU25qxPNO//SYhQcxvZBqbbxMo
         5XTFG2tKtmK3Krm+hsANjIvBza2JPcMCapu/NYmaqPKFJd3wIGXmpnnjeNlMKSJDnlfx
         35OlUI19+9kAy7C2/3Xb8q0CDlOjXVyq/6kgppnqGxVsJkeeKWnZZHIkDjikQXaqNJ+C
         zWfEeJj8hl3mXbucBM7GOZWNmX05qiumRBpAjqMKMsmZq35puZWjCLmrjtfuofHKeejf
         Q2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743404501; x=1744009301;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0EIRXaMi7x8XYwlCWwiW2XCs1AbE7FrNvdFZNLIYyY=;
        b=LbPi4ZTPmDiDPTrke8gHuZfTW45FT8MXjf0AyYzBFQPJQRpQqbSM8eGWLHWHv6vwDS
         A4eMqhH7YeOECOZlc1UZnpkiVb7nINvCOF4wIVi2dFdQCeBzcPRx8dpqPqDCUkcVBqpM
         hnpr3+nq78Lfzvp29l0qEE42ZVzKqBh3UJRCJtu0VmqUS2N+NtVDRjw0Jav2PJ0RWDfv
         YF4sfveiQNH8Lzjh82AxSt3ilRTLkXrDR+0+0MqiRIjdNGAzdcDZay1IS89dwuI+11nR
         6+tezxo2LmAPM0XiIb5Jv6ysKsgUWEMO9XBCP83yTmxtnLz5vBkCEmi5HUfWFhoxi30C
         mWtQ==
X-Gm-Message-State: AOJu0YzLQCJA2gwxTUovjatN4DdPw2QFguk0J1D3LcWkUPR7R+ukIVTm
	gWCJ0bFJcboEV446BzVCC/mBxzidXlKDOjor+YghCQiiWXl8/QKcQzzzmD8LrVc=
X-Gm-Gg: ASbGncvoDQJ4nwnAHExKpnes+JwRJu+NEnUyBZA4Vf0MYaNJ5+d8nsY/L1de/yaHbl/
	Z5V3GOyHKXUlzv8HriNDrQW0X5N1ouaQwY8EwCcs+N8lQZ6T9PMe39nlj0/zyMsJZMjItEPOH3r
	sh5l243iTfFJ7cDCn2hQZCYVUjgLDz2xFyYM7l4MRIX5e7kuUjLnbW/qi51fWenw97e4Ft1dQ/b
	O1QquKXqfG6PgwfQKLh8V87qFjyaDwjGz9Gnp5xUmlq4i551sP8Kn9QzI0YMGH58RXxPn03xIUa
	4vcqc4oQ4QzAYpsXS04hro5OEB24EUvPZ8PZ95dT9vxJjaz3CrzAWS3sawZ4uo+F2Q==
X-Google-Smtp-Source: AGHT+IEeWSQJLYKN04bNEh+7lHsUNrdL5zsVbpE6bLIsWK5/LcK1CEV9vqu2gqFuUvmhYfQrRpRW/g==
X-Received: by 2002:a05:6000:2183:b0:39c:1257:febb with SMTP id ffacd0b85a97d-39c1257ff09mr4622649f8f.59.1743404500748;
        Mon, 31 Mar 2025 00:01:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e6ab48sm158442325e9.10.2025.03.31.00.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 00:01:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
In-Reply-To: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
References: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/7] dts: amlogic: enable UART RX and TX pull up by
 default
Message-Id: <174340449998.221709.10827817044945834716.b4-ty@linaro.org>
Date: Mon, 31 Mar 2025 09:01:39 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_000142_711101_FD541601 
X-CRM114-Status: GOOD (  13.22  )
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
Cc: devicetree@vger.kernel.org, khilman@baylibre.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Sat, 29 Mar 2025 19:58:48 +0100, Martin Blumenstingl wrote:
> On the LibreELEC forum there have been reports that Odroid-C2 does not
> boot when UART is left disconnected [0]. It turns out that this can be
> solved by enabling the SoCs pull-up resistor on the UART RX and TX
> pads [1].
> It's not clear whether that specific Odroid-C2 board has a broken
> resistor, the resistor is not populated (either by accident or on
> purpose) or if there's another reason.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[1/7] ARM: dts: amlogic: meson8: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/cfd9d2466ed2891bacb6319bcf9af55f21d0263e
[2/7] ARM: dts: amlogic: meson8b: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/7374b06e8099ce7345ff3afd4bb756dde25971c1
[3/7] arm64: dts: amlogic: gxbb: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/b00fe005612080772fe4f00c61e2fcdd2dea18f0
[4/7] arm64: dts: amlogic: gxl: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/bbeb3017f1596a0551ba0ee40866f8b4e0ca2d3e
[5/7] arm64: dts: amlogic: g12: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/867c3760da4ebd760115f17eca0b4bd3b668941c
[6/7] arm64: dts: amlogic: axg: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/48d5da715331f2fd5e17e64f9e75e74248223b66
[7/7] arm64: dts: amlogic: a1: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/b85aae3714e65d7b92a6c2c28f62cf66393dfcac

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
