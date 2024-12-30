Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6989E77188
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Dec 2024 09:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xaYNSSq06KmWFIuii9rR038xu95Q1fR8LXhDap/gdjE=; b=P3nOtuCExTvrDt
	xbHHGhim5ilIgdZumh7GFqW5ZiiVsvWbBtPZrnbBtOSafMgxPgZt0UZpnGSUlEhZJb2hMBWPwvS/T
	LuNl5Ks+KWypL3eDkQOb+DKRBqlz4SXKvcac1ZTnKMKs5d8537a8D+PgaIwF4RKmrtj/zheVvWrdi
	rK/k4UI6EPy1ZzMb3rbwsb/jhLJZrD1Jv+JCZZlHdsb2A0cxwEF6y7hmN7w8lTUylKlRFTTck0Kpg
	johW7DRxUNifI9fZ51zEQUbgQ8TYCJ/ax5Ho+iaL8upHZ6DRiyXKpiFvijiRGJuuBSfiOLGjhuHF1
	AcL+DYysK4FqzEsAbANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCYI-00000004zMe-0ueg;
	Mon, 30 Dec 2024 09:59:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCYE-00000004zLg-3Z5A
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Dec 2024 09:59:08 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso95641795e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Dec 2024 01:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735552745; x=1736157545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wg3rOrpJ/V4ITpzMYa7ur6drZTaKRgCmtn4RTKqUP6U=;
        b=RA95xLOUH8BiWJ6dKqNKd7nJP970DgDAiOS4NS6OFPAUWjIhEGfRmKCo8WGj7AuU31
         lHs1m8IBFMksJ6YMfiVA+6Ku+RzcWMy6sX6l4Cp6tTSAhVAvEX7KzItSXKmuop1dwb/Z
         w6a53M5Skpcba6GKtrGyYeQ5LeiMgNpKeoxbmQG/PVONmh7ohvKbDLxCOjHHs98WBMzx
         b7pqxiw+GqUIUbuZk5vdURrLUuF4XFILDUiChfSFcxUsjMTukS0jd0RxXNNb456RNklK
         lg1DlRW5UO1/XLxuc69+C7QOVwnT2xhzY+1102ladIvq4nYH02AtTUEKllsBc+fXGxfO
         AblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735552745; x=1736157545;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wg3rOrpJ/V4ITpzMYa7ur6drZTaKRgCmtn4RTKqUP6U=;
        b=ZRFktuKDIeIpm0r7K2wvDxx7Mr5sQWdTjKOpB6aC1ArijeI8IU+ldIXO9OjJqMHBx3
         0R+P02lUfeSIq1MKNg/NvNe88LKxZGAcLVMZ67V8CJfvDvIJF5AzVj7w4VBKuYQOLzcS
         dImucAbTYhoUJbVVQfWiVC6Dof3InyXfwH7pXocVJDoNexfrWhMEhLecwnDv+yvtiQuj
         lE/pqp93KQQAo7ujBXarznlNV9N2yLM0/h8AD7xQ8e4WL9hYyn6ZO7Ple41wXZEWfM5a
         LupE9TZAt501l9GE6qhOybkcezMFp6U88mWHWlwGXzx02d4iOErwPh7+vg2WO0U2DFtC
         fOJA==
X-Gm-Message-State: AOJu0Yy+yX3spg9rSvdXxmwhAT968+vEq+RNRQhbz1DJJnouFmTKyxmW
	2S9wjvtIsl6xqpYcgJUyKtOBu2SPf35UnYI/Hmq8S7xtaH/cOi4wm43t3IIVeo8=
X-Gm-Gg: ASbGncv4k/XJyLr75I2CBQD6sZXMkBxKOM2SqSZu1G80SvmjTfdYhEoZkdH39gGZyZ0
	OaA+X5TOyf/L+eyioE5n+/TUUOCPdTujnCzZBp6GTfGZvhqfwAzRY5oMuGjfMP7ciUsFH1nxdq8
	UWEXXDNEL1iEbvqI8mH3YJ8uxqAlk8TswnPNjlamwpAyR3tc0C8kMKUn7WrhIeKm2OY3pP8zYfM
	+lmoW0Z73DIUYG+pt62kJnRqJjC9//vN6qiUtaaWvBLSEq8Nr/ZtSMFR9FMjyPlO5j7mz7fs3Jj
	3Q==
X-Google-Smtp-Source: AGHT+IHr0EeJk2baaepc6dGYNclRyZGkhsRUfmQUaioxZkb4SLPwgkjT+Y6PbldALk9VG7k/0s1IDg==
X-Received: by 2002:a05:600c:294c:b0:436:51bb:7a53 with SMTP id 5b1f17b1804b1-43668643ba9mr312560605e9.12.1735552745215;
        Mon, 30 Dec 2024 01:59:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832c45sm29382108f8f.32.2024.12.30.01.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:59:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, jbrunet@baylibre.com
In-Reply-To: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
References: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
Subject: Re: (subset) [PATCH 0/5] dts: amlogic: switch to the new PWM
 controller binding
Message-Id: <173555274448.2075376.17109271239824246199.b4-ty@linaro.org>
Date: Mon, 30 Dec 2024 10:59:04 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_015906_896029_CB078AE1 
X-CRM114-Status: GOOD (  12.61  )
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

On Fri, 27 Dec 2024 22:25:09 +0100, Martin Blumenstingl wrote:
> This series switches all Amlogic SoCs to use the new PWM controller
> binding. The main benefits of the new binding are:
> - the pwm controller driver now picks the best possible clock to
>   achieve the most accurate pwm output
> - board.dts don't have to know about the pwm clock inputs anymore (as
>   the driver picks the best one automatically)
> - new SoCs only need a new compatible string but no pwm-meson driver
>   changes, assuming only the clock inputs differ from older IP
>   revisions
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.15/arm-dt)

[1/5] ARM: dts: amlogic: meson8: switch to the new PWM controller binding
      https://git.kernel.org/amlogic/c/d352e8fc91526bdbb70468e8dea13581b905891f
[2/5] ARM: dts: amlogic: meson8b: switch to the new PWM controller binding
      https://git.kernel.org/amlogic/c/39786592bfdd92b64a68283fa896e108ca9822de

These changes has been applied on the intermediate git tree [1].

The v6.15/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
