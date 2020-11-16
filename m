Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1E6C4742C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 06:20:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BBE22222E
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 06:20:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1K8ck7V7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TI6RaHtE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BBE22222E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CPD8snIMNzDoa4wCcMdv+jKQiJ1jLwy5YBADcUat9/s=; b=1K8ck7V75RGtMEyCCHjVEGrxxc
	09DpHl0DID1AiDYQgv9wzKWnJ+QLVAIi/FXC+Z2xXCjMG5VzAiIpnFIesoTWuJPVpNfWEXFKj+Ocl
	NzgtxNElc5n6EvK9rB8ZA3V8ccEUZk/NDdw50YCbejlAy/KhgvXZSTrre1jRD5+OgPfuBv5y1xnEG
	jkPRvBAQVwKtSVcLMUJ1nAyEmZrMoMiKRcOgBA1+OkFf0mtVnqZoXKIo0FjxYCUTh8gwHJNrC5E2b
	26JjvX6c2NGDkH90vaMSB/ZzR5SYAwn5m82nvcR1OQG4ds+8QyMrPy4CzTHw5mrKNEg5xuWELoFlp
	rgpWV/Kg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keXsY-00015e-KS; Mon, 16 Nov 2020 06:20:42 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keXsS-00013F-8s; Mon, 16 Nov 2020 06:20:37 +0000
Received: by mail-wr1-x42f.google.com with SMTP id j7so17371256wrp.3;
 Sun, 15 Nov 2020 22:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=PRE33PyX0DgQV+nPjucF/BuaE/3yxdmGeh7qvmvEzro=;
 b=TI6RaHtEPsDA2gqYraJ1fkUSJhdCI6IMKeSAjnX8tAupeoT+MgZnMJytGNyIeJZb8E
 tejpSnUoo2UJl1gYC6y9klVRPRhiTrakvO4ZCFqcry7L52wJBCNEoN1riuc7MWnkSfED
 i4AWh/1K0qK32fKaLtQECbwi89jKWtlg/hKWREor0cWTAcRgg2mqbtr/DL9tT9YVO96t
 cIudPEJKp45VpY01drRruOxH/iZRoCFtBuCqIevGTc8yQMJZYXMwLiZ/sELtds2iy0M/
 ZDRiBx3yvk+9u2V0DNPPyTqspOCcXxm4FE6cMZ2fhtaa+wOq3UY5+hlJoMQHDSnGqeA1
 wHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PRE33PyX0DgQV+nPjucF/BuaE/3yxdmGeh7qvmvEzro=;
 b=OyqSdLATM51WERVuij5a3dOra7FJmV1WGDotNPJG6+HqFrKK9U00douYbyUjZ3rH7D
 pE+cP2UB4msFOnpzrP/tem1Z2wQXXoRiPzTwj7Tu5b7bo2p4zqyhHiL6tAAJ828iVrK5
 geeRWqt99spiKIV3H867Sqj7L6gYxI2cy/p09aaBGDtI2Z0GXlyKHpPlnarpd2nS+Byz
 vV8bSU29dFaxMULJNXb/dP6byagnXxlf69eEmp/l9sFSZzSD+5BKbcLRNyGPjyQciPKY
 AFHfdFXfO4CJ6ELAyG1RJjTZsdulVVAVbNM47Vb3pS+oy2vXHaHWILgBeca0gFuCqXnX
 ZQvQ==
X-Gm-Message-State: AOAM533yjxScFpTyJ0HKQtLrqY4G9kTTqp3UL54dE052Hya47c1cXbB7
 XPi43Kha6UBEaWTfO09uq3kU8PXjiIc=
X-Google-Smtp-Source: ABdhPJzKlFtq6d42gqMkJc5oVxVrMJJ1WBeET4rSm0rF+ADL8gJZL3ZhaIZJBUubub86R0pfcSCdDw==
X-Received: by 2002:a5d:4d02:: with SMTP id z2mr9475903wrt.109.1605507635254; 
 Sun, 15 Nov 2020 22:20:35 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m3sm17065985wrv.6.2020.11.15.22.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 22:20:34 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] arm64: dts: meson: add more GX soundcards
Date: Mon, 16 Nov 2020 06:20:24 +0000
Message-Id: <20201116062031.11233-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_012036_357962_AFB3EC16 
X-CRM114-Status: GOOD (  12.25  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series adds basic support for LPCM audio over HDMI and S/PDIF
to GXBB/GXL/GXM devices that I own and have tested with. Audio can
be extended in the future (some devices have DACs and headphone
hardware to connect) but this gets the basics working.

Changes from v2
- Drop p200/p201/p212-s905x/vega-s95 changes
- Add khadas-vim(1)

Changes from v1
- Drop nexbox-a1 and rbox-pro 

Christian Hewitt (7):
  arm64: dts: meson: add audio playback to a95x
  arm64: dts: meson: add audio playback to khadas-vim
  arm64: dts: meson: add audio playback to khadas-vim2
  arm64: dts: meson: add audio playback to nanopi-k2
  arm64: dts: meson: add audio playback to odroid-c2
  arm64: dts: meson: add audio playback to wetek-hub
  arm64: dts: meson: add audio playback to wetek-play2

 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 40 ++++++++++++
 .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    | 40 ++++++++++++
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 40 ++++++++++++
 .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts | 40 ++++++++++++
 .../dts/amlogic/meson-gxbb-wetek-play2.dts    | 61 +++++++++++++++++++
 .../amlogic/meson-gxl-s905x-khadas-vim.dts    | 43 ++++++++++++-
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     | 44 ++++++++++++-
 7 files changed, 303 insertions(+), 5 deletions(-)

-- 
2.17.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
