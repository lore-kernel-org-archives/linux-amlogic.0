Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA76AE77188
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Dec 2024 10:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nMCukQyXTeN0lxgPw1k5qa0OZh81C1xR8DB2sXEFbvQ=; b=lkwsmFuP+C92IK
	bA1uySe8+YA+zs2ue46xlFrDVa/tJlsD93zsGatsftkFEMcHIy8qVvBNzgPoj5YX4fLn67TBFj//8
	SyvxmVejnXbzHsvYO6allw7eqQStCThIgflg+9X7KpGP7rPIV+yjPAHp2kB0kbYaqNGoorQBce6Wb
	vyd3+D16tuIgVPRiP0lSsckdnTVak0fQvbNpPAWmaIMm5/z9z5UNTV5RAkagf0vCLp71ndMohL4T+
	lKBC0oS5a2446hs2hUyg67X9imFPDNPFw1Nr+i8bnU+VdMbZ94fGsw1mSiG/EQeMHB9VvS0ABmUQQ
	/CqKeWwCOf9yKa9HgkMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCZT-00000004zXL-15Zj;
	Mon, 30 Dec 2024 10:00:23 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCYd-00000004zRC-4BKv
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Dec 2024 09:59:33 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38632b8ae71so6518285f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Dec 2024 01:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735552770; x=1736157570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORCqMwl+SAp/HgeyDZWrdJX6WYlSwrJwZn4hxNWVVck=;
        b=WeVf49BP9WG3Q/wiuY81KDK5doX1wGEEvdBJO4jaXOJmg3c816feV/8d+GCr8XdqEa
         SqK6jt43GntvjsUESuGzZghLclYtga5dLCPkGpy1+OyxqlkC7YaFZPSnzQn8UZ2HNbb0
         MkkUkS7vaRN9tXTniZATB01dIwNyeC58voHAZ4vCY+xDzdlbRH7G7C35RlPsIT2t6VnG
         sDUs3oNN+oqs0g+ACqAsoI/mAdiFyin1P7J1/Yn4OP/lz1HEuO0eNeweDds3Zxqk6MHw
         1FvmZGOX7/DgKy4EFQt4RzX9urK0wz7bBufM+tPxVDBE1gliIboN6fk/JGpAmalvz9mP
         4cVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735552770; x=1736157570;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORCqMwl+SAp/HgeyDZWrdJX6WYlSwrJwZn4hxNWVVck=;
        b=GgusC2TYL8kDpzE+E7j151dYKpszG+yNWibpXzqURUNpwdTyMyGxdbPLyOyk7/wraA
         sw496dGYZqe2bsPlyX5E5SsG7p1hTfynLSlF++XiTjF4rCbTEpGBOPMmT++lW5cVnqNP
         3TPmuKpXOngTaQRMgquAUDHsjzr+Umhdr2BtThypmtnpOo6FREn51fgPAxQrWBgp/dlL
         oDDnQXyYNjOX1LS88fV2+9flKSuv4aTxHMKxvvSrk0GpgDU0bw+En7LIH7r0nmcp458G
         yqt89GlhqEJf8VsaG78D4aMSBbP4rxnjDv3ZyqFN3OC4XkDs3zEUf7LR6r16GRlbDsHa
         SUVg==
X-Gm-Message-State: AOJu0YxizhWZaUzDkgLzc3LQvLXc8JOkjeyTXQY+ZpJKYGE7S8AREGfX
	rXdCfG4Buur/Dukz3u7Yk65f+O7ZSQmS3HOLxEHLUt0tdEt+uQoGRcNt8tPEbKk=
X-Gm-Gg: ASbGncuEfu+irwr++Zve1Bgo4h9wJg5oYx6pg9zEQ83VyFwJq0RFLsHbAPWizEYJc/R
	6EYWQHR6WmQGki8ecrDwXS45Deag6W2yKIcHc07+8WxTcCjpLsuX+P0hBbluak+NBixysRWKnJm
	vgDIHIqlny5gOWBknMjhYmUM011FGPqEZd+Wol0ppYuSEFOtypG3PjkuieigRg5vWTqiDSz6u4q
	R/FfLK9t47dFsjXmTf+VnnzG1UmgkkiyOacMFW2x5QnTEnPTedEDA9HTmKXpy2Cx1fU3lYaCrTP
	Fw==
X-Google-Smtp-Source: AGHT+IEtZftynNsczV2vu95ZXDwj5mXq7bMZgAVBOfkVYRXoJZgIO+SXbYok4rrRMwDseSXqu17tkQ==
X-Received: by 2002:adf:ab0c:0:b0:386:37f5:99f6 with SMTP id ffacd0b85a97d-38a223ff225mr24971091f8f.53.1735552770588;
        Mon, 30 Dec 2024 01:59:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c493sm347650735e9.28.2024.12.30.01.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:59:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, jbrunet@baylibre.com
In-Reply-To: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
References: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
Subject: Re: (subset) [PATCH 0/5] dts: amlogic: switch to the new PWM
 controller binding
Message-Id: <173555276981.2075882.719017533990914280.b4-ty@linaro.org>
Date: Mon, 30 Dec 2024 10:59:29 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_015932_183652_6464B488 
X-CRM114-Status: GOOD (  12.71  )
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

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.15/arm64-dt)

[3/5] arm64: dts: amlogic: gx: switch to the new PWM controller binding
      https://git.kernel.org/amlogic/c/12abaac5a70994490e565249dcffbb5c329b30bd
[4/5] arm64: dts: amlogic: axg: switch to the new PWM controller binding
      https://git.kernel.org/amlogic/c/77747dbb11466d5ac2ee11a260e8de0b65f3fd1c
[5/5] arm64: dts: amlogic: g12: switch to the new PWM controller binding
      https://git.kernel.org/amlogic/c/06c993691a2fdcabc43053a8fdd813cdeef516c4

These changes has been applied on the intermediate git tree [1].

The v6.15/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
