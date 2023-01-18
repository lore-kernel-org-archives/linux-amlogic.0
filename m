Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD3CC004D4
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 04:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJg/qGigR+aRczfiZ4adR7p85duQ8oQh0ufFMZkV2sU=; b=2d6CSj9c7JcuyM
	Ex3UGSCbxwJ3wiufir4u3WBULLJfoY38gBnhp/8JX/1Jea7fzFn8+L+cV2ODyojju1e3FlSFlW5Vr
	saur8gkc36a8933yEWHrSXIJ4/FGHJo0T1YDBRmpEcJMZ4tBG4t3Khmdub8/QvmND9EVrsKiu0KLT
	txnaY6td6lcinTTnompnEuzyQvdV05yxlmPPnlagr2aNMmAoGrfeOItTU0yn1yVEV1Y10IilXHvPb
	Fqd+NeEhhHo6oib5Pz1CshYDtUCMKYpbZgB5A8yw2leyxdJn255w7Ok4XJByvJvWY6QUtfMD2HfX4
	waBHJKMB0zdu0yy0UJBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI0KQ-00GtKV-Ag; Wed, 18 Jan 2023 04:45:38 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI0KN-00GtG6-Tw; Wed, 18 Jan 2023 04:45:37 +0000
Received: by mail-pg1-x52b.google.com with SMTP id r18so23621210pgr.12;
        Tue, 17 Jan 2023 20:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgLdZY95SndgcyNayQmxOdJ0Ym9jsDdjWpZ5HTkP+n4=;
        b=kA04TT2SWyelTnwWu3VzoKC2lS+ElZrLAswlaptiKeua2oH/N/FOx9BPJCBF03Upyw
         Ea1TY0Q7sa/dgvR1Fm05BnsLeHS0EhPAL/pZ1BCsQVYDQnAKtEjMR+qxoxy9GVvrJm5W
         Z4hXbul8TcR0WliJSP9LMGT2VxNuRvvPoFPqQF4tEgLa7K5W0z3qxYXi4szwoHjCq2t1
         a7pJyUduDg/fJt6gJ3M+Xb7lJUsvh+Koh/GxjlHBdOAgWDb4ZaHB4RIpNjhInUjUp9/O
         dayYfKZ4Cbe7Jfk0XLRiau3EregczJwjfRQWb5xlAv/FNzH5g8dP1FqqmJcL3azVTi7T
         BorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgLdZY95SndgcyNayQmxOdJ0Ym9jsDdjWpZ5HTkP+n4=;
        b=FsZWCY5m2bhXfPerbj9vORBInPBO/0I7+OW+twhK9UTP+wdivcPDzQnOAXGFtlBFlv
         MH6dQZFPQBJikE8ixwHpf/ow2lKlA+9fYOjpcRrSTc5moxBqHg1a1jSpSCxlIxLWsGTH
         /nDPvaxQ3VmAVcMcLQ70DbytsoMSCJsXnVRJrGaq2+8EQWKN5g4bG3uNoCVH4Jo2JAHM
         51+RkxsTOmxCem2qvchLg9VbLN44fd3thoXmy87rIZB1Pc3EQy5IwpcinRy6DEqf/3wP
         iSFx+euWUzfmfEbr1qzpLfMHu5BGyDZIgtQmjV3IM22N/1wwaTjUczjz7hX5oBlm8+Gy
         Eb/A==
X-Gm-Message-State: AFqh2kpqGZ36fKblgx6e7/PEwaz21Aj+1QKulpVT5LhjCDZWyShkszZ4
	Sm9wuHaKqp8nBplNQ8qvTxc=
X-Google-Smtp-Source: AMrXdXvcpQMDd5Il1H0XAbL82o8MyvvYHbcS6jd/GLlhIKTon/W4rX+AzpyR98pPPnfSeN6mdbT0EQ==
X-Received: by 2002:a62:6104:0:b0:588:a156:6a3d with SMTP id v4-20020a626104000000b00588a1566a3dmr6242169pfb.26.1674017129702;
        Tue, 17 Jan 2023 20:45:29 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id i1-20020a056a00004100b00581a156b920sm8682770pfk.132.2023.01.17.20.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 20:45:29 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-amlogic@lists.infradead.org,
	Matthias Kaehlcke <mka@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] arm64: defconfig: Enable USB onboard HUB driver
Date: Wed, 18 Jan 2023 04:44:17 +0000
Message-Id: <20230118044418.875-10-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118044418.875-1-linux.amoon@gmail.com>
References: <20230118044418.875-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_204535_979644_6336ABD6 
X-CRM114-Status: GOOD (  10.03  )
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

Enable the USB onboard HUB driver, used on Amlogic boards.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2: - none
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 851e8f9be06d..42c3528a2473 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -923,6 +923,7 @@ CONFIG_USB_SERIAL_CP210X=m
 CONFIG_USB_SERIAL_FTDI_SIO=m
 CONFIG_USB_SERIAL_OPTION=m
 CONFIG_USB_HSIC_USB3503=y
+CONFIG_USB_ONBOARD_HUB=m
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
