Return-Path: <SRS0=pKyR=WT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66005C3A5A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 13:09:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B71221848
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 13:09:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qJcE74kU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OI/DuJjk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B71221848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=co+sEogiTr8FlvW+C27CDZ9I41xbU5Dzfw7CT1J//vE=; b=qJc
	E74kUM2ArdiavOl6BSsPuQlY6kPtXFbnB3qVmoLya31ydCtRQkbs+8M8mNnd7AyXsy5nNJbqCqhox
	BVEg6O2nU2wgLqnO4fpxUvuoFgynz8s0CcL4KVsm8hXFGuVppyD/JVupD1ZiiuvYQ8O+Jqd94Rr1k
	9Ka78Edk2JLPX6h0rKC23iSoRQdDn0/tYAhCNkcVN0yIfZSWxR9Jlbzso1aJc/3ZzIUtitj69OXw1
	Fb/I/upAaysOWcZKWKL6cgJQZPesp6wtlIZxnhtjYiep+dxFlz5HjG8o18PtxmXOaTnsF0zCHk1Kw
	JTBRJOIVYDfRLRWuNaVvU/KhY7J1Slg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i19Jz-0005CJ-R4; Fri, 23 Aug 2019 13:09:39 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i19Jq-000539-FY; Fri, 23 Aug 2019 13:09:31 +0000
Received: by mail-wm1-x344.google.com with SMTP id m125so9055643wmm.3;
 Fri, 23 Aug 2019 06:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=LWXkxTKcRZuK292VQyIRV7T1k9jBHkOyzAtwhFmEx4c=;
 b=OI/DuJjkgMGlZXQBPkxHh7TQ1GzMlu1cMrka1NBxb23WtIcK4HizOFzrxuBp5U3D6M
 nfqr4jWlguNXsb8Dx3J7bdrl4fHVXfg2BZl4UR15+FgjLMdyZ8Tm7LxPIHAUMdA/nE/u
 j2FsayR5GXtTklBPxc9aokyalNPzRP5H2nxtXRKrB7Zg3k++0RCcn9A5oYV0TUo/XXT6
 4W5bKkVVYW4CdK7WxFRhEuWsBom+5vDcbCQVmJ/iMp7Jm/0WkAUTcNOCEp6Fqh1vXOEX
 F1QSySyl7FYgsQYzygsu1x2Et5dJFWNhtbWVWJb2YNgz+aeCoZ93p/iMlhQCGqN6yjI3
 uajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LWXkxTKcRZuK292VQyIRV7T1k9jBHkOyzAtwhFmEx4c=;
 b=jWy+e4+yf8+b4APS2pch56yfcKExBcQpgw+BnDcX8C4P4dLh6rlDjy1kZ411Lfaarm
 muEeKr2DCMSh7KmQwzAyJ9lMhNs+8z7tK0y143VQb9/6rMIId90Gg6NfGmeQ3I5s7QUq
 qCPG9f2FjDT6Sl8NZZD0KeSsgQIv1Fnx2z58SQKAycoy7vAXR60ZUCKtDhLI4u0hMm+F
 uu0l+0fIQLR7wjaBPOr19g8BR0gHOWzWCbfSmw95vfAcH0S2OT0roG9zqAXkZs6MVhPZ
 yrvU7u2MEM1G+toiMfm/S10JhVslRLBfAcqVAkoulR9z1XTQ9SrvxZS61w4z756lEK71
 lfcA==
X-Gm-Message-State: APjAAAVlD2q6LqbzopIs55EISE6gc2l56QhB2L2JJSw6640IPLIi6MPr
 cRepGcjRMnFnRFikKiZ4WVk=
X-Google-Smtp-Source: APXvYqwhKpHj0Q8fey8hFsDLLv62Ne9/S5zXf2J1J0WNDTeBqAJTNILW9Bi8PNbYj4YgXgkxnlrKDg==
X-Received: by 2002:a1c:5402:: with SMTP id i2mr5151617wmb.41.1566565768392;
 Fri, 23 Aug 2019 06:09:28 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id m7sm4359854wmi.18.2019.08.23.06.09.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 23 Aug 2019 06:09:27 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: meson-g12b: Add support for the Ugoos AM6
Date: Fri, 23 Aug 2019 17:08:34 +0400
Message-Id: <1566565717-5182-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_060930_524901_F7EC2FD2 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Oleg Ivanov <balbes-150@yandex.ru>,
 Chrisitian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds support for the Ugoos AM6, an Android STB based on
the Amlogic W400 reference design with the S922X chipset.

Christian Hewitt (1):
  dt-bindings: arm: amlogic: Add support for the Ugoos AM6

chewitt (2):
  dt-bindings: Add vendor prefix for Ugoos
  arm64: dts: meson-g12b-ugoos-am6: add initial device-tree

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts      | 567 +++++++++++++++++++++
 4 files changed, 571 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts

-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
