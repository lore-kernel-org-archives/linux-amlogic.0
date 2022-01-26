Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D75C28CF5
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jan 2022 04:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LUVyQL7+2r//MZmPgIJsNMbbZyx7I6AKLYh1XVAB9zk=; b=h7Lhxkmkst9HuW
	6/UVTPOpc+V/07xrmW7SihvmeYKLFmQhM+sv1On/99Vgg/Tlr8ZtkFZWSRhMAoZQvLvCpFdURD2aX
	KGDYjnbNqnDl7pBYVkmQ74VncJbx4pIM8v0AcSz4YhmFJlFtZy6Le2iG+ZybEspoouOGuSXXkejUH
	HRwu86YJVMjptA7hjRJphtgrjBd/Th6bHIDg/8mvEhBcMZP7Fe12ospIDquorxVe/AjXTTyyP8Pt3
	YfPJXbkOY8PsYZSFYOQmbXrBVVHxqdoMv7u9ZNSil7C4CU0rT1K62OQIW/exGrXZnzrncOIPxR5KS
	rPI7wVi8bfPx2E72pYIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCaG6-00A9MH-Kf; Wed, 26 Jan 2022 04:50:14 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCaFt-00A9HR-1t; Wed, 26 Jan 2022 04:50:02 +0000
Received: by mail-wr1-x42d.google.com with SMTP id s9so7749171wrb.6;
 Tue, 25 Jan 2022 20:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=ZnFERg4538qEnnFDm3nu3v0KamXDEvSagtuMNAkM2ec=;
 b=qzRXO/gyUPn6B8dOERb/z9Y2l1TuydXikcK0/je5mLsxfq7ZFu8syLt8nbh04TjPxP
 dFGw9oIHNDND0snYVrh2+T0HuQ1YH508eLbxae339V703WQO2MDftLW4Hm2mHZaxZo3D
 k9VDBUMow7gaZwOcoITKmoJs4KFW1FXOlolKpH63E9htJig4tUhaLuFQgeC1R6+jw5on
 agpJJP4Az3OrTs6+4UCcnfWnbtf4i/9GZLZFFZrZ5zj6b7mADaP7ftrjPocQzYE3BFXK
 J0vB+HNU9TlXgdO+Eb+OnREx0KfLLYAIAOTLfdKHJHFvjr14/km/y6x1r1BwVrAataFk
 rggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZnFERg4538qEnnFDm3nu3v0KamXDEvSagtuMNAkM2ec=;
 b=ADHcfPyVTq0eTaLnjs6ALdULpCD854CeqWNlAKzep50iQGkU0dwkH1mCYEiTBFr1Fk
 aXhsIw3xRAsJKL7MRL8HEtZjZY5G0LWLhKH+NXHU/8Bm1/mwH/omk171sbZnVXZzX7CZ
 7tniXocceaYjy4nyPNmtaNuBEwAbatrzOQfFHeK67nE+zCi4NqrXS+oidp0L5ErF2YjI
 gD0j1/vdtm+E7q12FCQmtbkdxo7UQa7lhJBJoSPIpHawW67oXbWUEOxxlmE5hiUOOiN8
 rDWX+F/K91WuUyfZTI6ZLdCs1gFzhaDE9bvvboA+kVTM1EOUW2vu6qLQbDJ5FgtrCOAC
 qClg==
X-Gm-Message-State: AOAM531LM9Yc4M+GPkOnp4VDeKKofsWpr04eLuWeOGNn0fbZNMvaT8C8
 L6Y+lkx3xuoOVgpEap8Ig4o=
X-Google-Smtp-Source: ABdhPJxMQ+Owhslgsg6YV8JFt0RhWAyKkZIa7OOaBUy/CVMbb3/CMJS3NJ/mczCB9JDwi2x+UMB0bQ==
X-Received: by 2002:adf:ee12:: with SMTP id y18mr20829820wrn.298.1643172598738; 
 Tue, 25 Jan 2022 20:49:58 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id n15sm2171342wmr.26.2022.01.25.20.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 20:49:58 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 0/3] arm64: dts: meson: add ATF BL32 reserved-memory regions
Date: Wed, 26 Jan 2022 04:49:51 +0000
Message-Id: <20220126044954.19069-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_205001_134420_FF4DF060 
X-CRM114-Status: GOOD (  13.95  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series supersedes [0] which fixed a long-running kernel panic issue
seen with Beelink G12B devices booted from Amlogic vendor firmware. The
same issue exists with a wider set of devices from GXBB to SM1, although
it is not often seen due to my kernel fork including 'catch-all' patches
for some time (the meson-gx patch was suggested by Matheusz in 2019) and
many distros actively supporting Amlogic hardware consuming some or all
of my regular patchset.

I've also included a cleanup to the SEI510/SEI610 board files. If that's
not desirable feel free to ignore that patch. I also dropped the fixes
tagging as I'm not sure what original commits could be targetted. If you
think fixes are good please provide some guidance and I'll be happy to
send a revised series.

[0] https://patchwork.kernel.org/project/linux-amlogic/list/?series=607446

Christian Hewitt (3):
  arm64: dts: meson-gx: add ATF BL32 reserved-memory region
  arm64: dts: meson-g12: add ATF BL32 reserved-memory region
  arm64: dts: meson-g12: drop BL32 region from SEI510/SEI610

 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | 8 --------
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts  | 8 --------
 4 files changed, 12 insertions(+), 16 deletions(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
