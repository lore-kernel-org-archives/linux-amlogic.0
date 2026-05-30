Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4EACD6E4A
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 May 2026 09:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TUfgqaKCZ+x+Dptqpqh2rXY8TlrdXYYCTcjKw1UXamE=; b=UPqR7dMpf1st45
	14PeH6KEhViNMbB1yjdist2q16SU8Cbv7AintSwNcniD4iTGgoz7L93nvU+hmQhLVEgu1KXbla89y
	kB6GLgWp8K8jZ6J7N7NSLxjIvOgnjaZZP2qSIH9F+JI0OhA9WcKJTYQwPNQI2QZFnr8LpwPkep0yF
	u67riH8wL22aouxHi+MvzyPaUCt1puDcpfK6IwzRHTZvJdbjehL7JKB9eFHKR41Q8WLhYyegyNgmm
	Z3E+rNWEtdn349N0R9bnqpD4AUPB3gjwZ/XmF1j+8ynXrrvlDyPVLUynK36qFwO3ncSOai7iGLVL2
	rCLUSURbJZ/cSt+sY32g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGFX-00000008att-18r7;
	Sat, 30 May 2026 09:44:59 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGFS-00000008apY-0dRL
	for linux-amlogic@lists.infradead.org;
	Sat, 30 May 2026 09:44:57 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2bab82d75fdso75061035ad.2
        for <linux-amlogic@lists.infradead.org>; Sat, 30 May 2026 02:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134293; x=1780739093; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eg9ggvkEkoQKR+hIDJPnP9lc/gF7VRqufBdsoqX52Vc=;
        b=os+Tpt4Agfc9cAKsndlHPjAkf542T5rI/8B8/zjsWff1qkadnlwYbaPxVq2lX1pdPk
         FzLEdY4W4A1cXW3/S6YrVn8TabNbEYOyetPOUSOPX/7t41uGvz8TDPvP8LKo5bE6sidC
         T5qBZO2GkQ67kf94gfNiGbPg1R5SaIDxiDJ9cAkc2Og0n5lCoQmkkWolqDQf3mWp1Dte
         69kZXpFqp0aG6Hzxy/xaxNDo4OrZH/t/CJvDLrOeUhalIkbxnFJUBsUuEkGOlG6XOoIt
         QQLBaFHPXkHJlzi3TEhaSLIs5RlVV+1+MlSjH9y+2jHpwokhjoggjy2TIhOIwGmPsXo6
         VU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134293; x=1780739093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eg9ggvkEkoQKR+hIDJPnP9lc/gF7VRqufBdsoqX52Vc=;
        b=OpC+EOQuGFseovx3PSWLzYspk6Jv+KCLhF8XjCpCIX5GpMq6vFyACvDW6yZd1RiS5q
         V7rT7BgscaThtUo1ks50jA0/8LBDPiE9wpkMisjMI7ZgUlgTvSpwslayCMjpfyFu4UUL
         nkIVamLQNcBPTkcE1hIwqL9AakBFAqENmQBT+gMXx6sqJsZQgmwhhs0OIfB3jEn8BzQd
         8Pxwr0hTkUfW4VNCffp7kuD5XmYivA4Opt+Rl8E7wmeDJx/lTv78b3SKBgmvaYa7vBUk
         CrQnAFPrdTBEljVzU9ZgfOXLYhuhLocBoC6bFa2AegZnTuRlNVbDH2e/oWEVdMPbvVUS
         1zkw==
X-Forwarded-Encrypted: i=1; AFNElJ+mwtMehv7FVqtroymeeoTch+gck0isws+mIAXcvG3okGzfI8w01+SYXXipOb31RCPNvrRfjqqMqnIUr//t@lists.infradead.org
X-Gm-Message-State: AOJu0YwWQF1yFsxEj7+FY581Abd+9vaMkwAAPSf7oORwRlOJMOtJ68Fy
	Kgy+fPwNELYe6znRfFu6hRqepNFOY9ZKssNDtD6Po9MifDZJ071G6GdH
X-Gm-Gg: Acq92OEFZbH8kFJSqNgh36yr3bgC1rCf212lmLnbspzT+5/nT/Z3V2ph+rs5sueXNZx
	G+DAVUo5UNvWDR4VL0gv/TY6syYTZfQX790H6X429zSjexIrrTn10F1KGY476BLBWOEIS6+kn7O
	mCYHwfWAvbrxK8tt3impQkT0QmhMtXVk6gCfQ9fXLOIe0LVa0/XmXxuGPvSXX7O/K1N+dWl158U
	19RJXUHSPfohPMjlqUEw0kUwR6vxJF5VsB96XnJStSRxf5mZ3ma6nc/lX8aDltw7JP4P5Yq9fbb
	vXT5wSG3Vfm8Cy1xpD6LN+JXij+iX7TbxVjSg0Vfe68DttBKZi9X7OPHSfJsf6NqYy0uT82A8WG
	+zwutgluF+8Y8N5ZqAyrtFNtTUkxkb4iI/wzIrrb78L9TwGsKteTNW/euA1epL1VCEOP/XvuWPe
	Qtg5T6cs6/i1yOECxb2/4giIKUcyUA4iI=
X-Received: by 2002:a17:902:c94c:b0:2b2:be01:5532 with SMTP id d9443c01a7336-2bf3686d1dcmr41074635ad.35.1780134293228;
        Sat, 30 May 2026 02:44:53 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:44:52 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v6 5/8] media: meson: vdec: Cancel esparser work during teardown
Date: Sat, 30 May 2026 15:12:51 +0530
Message-ID: <20260530094326.11892-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_024454_198805_9D6C8490 
X-CRM114-Status: GOOD (  17.07  )
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
Cc: Sashiko <sashiko-bot@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIGVzcGFyc2VyIHdvcmtxdWV1ZSBjb3VsZCByZW1haW4gYWN0aXZlIGR1cmluZyBlcnJvciB1
bndpbmQsCnN0cmVhbWluZyBzdG9wLCBvciBkZXZpY2UgY2xvc2UsIGxlYWRpbmcgdG8gdXNl4oCR
YWZ0ZXLigJFmcmVlIHdoZW4Kd29yayBpdGVtcyBhY2Nlc3NlZCBmcmVlZCBzZXNzaW9uIG1lbW9y
eS4KCkZpeCB0aGlzIGJ5IGV4cGxpY2l0bHkgY2FuY2VsbGluZyB0aGUgd29yayBpbiBhbGwgdGVh
cmRvd24gcGF0aHM6CgotIENhbGwgY2FuY2VsX3dvcmtfc3luYygmc2Vzcy0+ZXNwYXJzZXJfcXVl
dWVfd29yaykgaW4KICB2ZGVjX3N0YXJ0X3N0cmVhbWluZygpIGVycm9yIHVud2luZCwgdmRlY19z
dG9wX3N0cmVhbWluZygpLAogIGFuZCB2ZGVjX2Nsb3NlKCkuCi0gRW5zdXJlIHRoZSB3b3JrcXVl
dWUgaXMgZHJhaW5lZCBiZWZvcmUgcmVsZWFzaW5nIHNlc3Npb24KICBzdGF0ZSBhbmQgYnVmZmVy
cy4KLSBNb3ZlIGNvZGVjX29wcy0+ZHJhaW4oKSBldmFsdWF0aW9uIGVhcmxpZXIgaW4gc3RvcF9z
dHJlYW1pbmcoKQogIHVzaW5nIHRoZSBzdGF0dXMgc25hcHNob3QsIHNvIGRyYWluaW5nIG9jY3Vy
cyBiZWZvcmUgYnVmZmVyCiAgY2xlYW51cC4KCkZvbGxvd2luZyBjaGFuZ2UgcHJldmVudHMgZGFu
Z2xpbmcgd29yayBleGVjdXRpb24sIGVsaW1pbmF0ZXMKdXNl4oCRYWZ0ZXLigJFmcmVlIGhhemFy
ZHMsIGFuZCBlbnN1cmVzIG9yZGVybHkgdGVhcmRvd24gb2YgZGVjb2RlcgpyZXNvdXJjZXMuCgpD
YzogTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVzbmUuY2E+ClJlcG9ydGVkLWJ5OiBT
YXNoaWtvIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPgpDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI2MDUyMTA5MDk0NC5GMzU0MDFGMDBBM0RAc210cC5rZXJuZWwub3JnLwpG
aXhlczogM2U3ZjUxYmQ5NjA3ICgibWVkaWE6IG1lc29uOiBhZGQgdjRsMiBtMm0gdmlkZW8gZGVj
b2RlciBkcml2ZXIiKQpTaWduZWQtb2ZmLWJ5OiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFp
bC5jb20+Ci0tLQogZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5jIHwgMTgg
KysrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRl
Yy92ZGVjLmMgYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjLmMKaW5kZXgg
Njk4YTk1NTY2YWQyLi40ODg0ZWUwNGIzNTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9t
ZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24v
dmRlYy92ZGVjLmMKQEAgLTM4MCw2ICszODAsOCBAQCBzdGF0aWMgaW50IHZkZWNfc3RhcnRfc3Ry
ZWFtaW5nKHN0cnVjdCB2YjJfcXVldWUgKnEsIHVuc2lnbmVkIGludCBjb3VudCkKIAkJCSAgc2Vz
cy0+dmlmaWZvX3ZhZGRyLCBzZXNzLT52aWZpZm9fcGFkZHIpOwogCXNlc3MtPnZpZmlmb192YWRk
ciA9IE5VTEw7CiBidWZzX2RvbmU6CisJY2FuY2VsX3dvcmtfc3luYygmc2Vzcy0+ZXNwYXJzZXJf
cXVldWVfd29yayk7CisKIAltdXRleF9sb2NrKCZjb3JlLT5sb2NrKTsKIAlpZiAoY29yZS0+Y3Vy
X3Nlc3MgPT0gc2VzcykKIAkJY29yZS0+Y3VyX3Nlc3MgPSBOVUxMOwpAQCAtNDM3LDYgKzQzOSw4
IEBAIHN0YXRpYyB2b2lkIHZkZWNfc3RvcF9zdHJlYW1pbmcoc3RydWN0IHZiMl9xdWV1ZSAqcSkK
IAlzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyICpidWY7CiAJZW51bSBhbXZkZWNfc3RhdHVzIG9sZF9z
dGF0dXM7CiAKKwljYW5jZWxfd29ya19zeW5jKCZzZXNzLT5lc3BhcnNlcl9xdWV1ZV93b3JrKTsK
KwogCS8qCiAJICogU2FmZWx5IHNuYXBzaG90IHRoZSBzdGF0dXMgYW5kIGNsZWFyIHRoZSBoYXJk
d2FyZSBvd25lciBpbnNpZGUKIAkgKiB0aGUgbXV0ZXggdG8gcHJldmVudCBkYXRhIHJhY2VzIHdp
dGggY29uY3VycmVudCBTVFJFQU1PTiByZXF1ZXN0cy4KQEAgLTQ0OCw3ICs0NTIsMTEgQEAgc3Rh
dGljIHZvaWQgdmRlY19zdG9wX3N0cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVlICpxKQogCXNlc3Mt
PnN0YXR1cyA9IFNUQVRVU19TVE9QUEVEOwogCW11dGV4X3VubG9jaygmY29yZS0+bG9jayk7CiAK
LQkvKiBFdmFsdWF0ZSB0aGUgaGFyZHdhcmUgc3RhdGUgdXNpbmcgb3VyIHNuYXBzaG90ICovCisJ
aWYgKHEtPnR5cGUgIT0gVjRMMl9CVUZfVFlQRV9WSURFT19PVVRQVVRfTVBMQU5FKSB7CisJCWlm
IChvbGRfc3RhdHVzID49IFNUQVRVU19SVU5OSU5HICYmIGNvZGVjX29wcy0+ZHJhaW4pCisJCQlj
b2RlY19vcHMtPmRyYWluKHNlc3MpOworCX0KKwogCWlmIChvbGRfc3RhdHVzID09IFNUQVRVU19S
VU5OSU5HIHx8CiAJICAgIG9sZF9zdGF0dXMgPT0gU1RBVFVTX0lOSVQgfHwKIAkgICAgKG9sZF9z
dGF0dXMgPT0gU1RBVFVTX05FRURTX1JFU1VNRSAmJgpAQCAtNDcyLDE2ICs0ODAsMTAgQEAgc3Rh
dGljIHZvaWQgdmRlY19zdG9wX3N0cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVlICpxKQogCWlmIChx
LT50eXBlID09IFY0TDJfQlVGX1RZUEVfVklERU9fT1VUUFVUX01QTEFORSkgewogCQl3aGlsZSAo
KGJ1ZiA9IHY0bDJfbTJtX3NyY19idWZfcmVtb3ZlKHNlc3MtPm0ybV9jdHgpKSkKIAkJCXY0bDJf
bTJtX2J1Zl9kb25lKGJ1ZiwgVkIyX0JVRl9TVEFURV9FUlJPUik7Ci0KIAkJc2Vzcy0+c3RyZWFt
b25fb3V0ID0gMDsKIAl9IGVsc2UgewotCQkvKiBEcmFpbiByZW1haW5pbmcgcmVmcyBpZiB3YXMg
c3RpbGwgcnVubmluZyB1c2luZyB0aGUgc25hcHNob3QgKi8KLQkJaWYgKG9sZF9zdGF0dXMgPj0g
U1RBVFVTX1JVTk5JTkcgJiYgY29kZWNfb3BzLT5kcmFpbikKLQkJCWNvZGVjX29wcy0+ZHJhaW4o
c2Vzcyk7Ci0KIAkJd2hpbGUgKChidWYgPSB2NGwyX20ybV9kc3RfYnVmX3JlbW92ZShzZXNzLT5t
Mm1fY3R4KSkpCiAJCQl2NGwyX20ybV9idWZfZG9uZShidWYsIFZCMl9CVUZfU1RBVEVfRVJST1Ip
OwotCiAJCXNlc3MtPnN0cmVhbW9uX2NhcCA9IDA7CiAJfQogfQpAQCAtOTY3LDYgKzk2OSw4IEBA
IHN0YXRpYyBpbnQgdmRlY19jbG9zZShzdHJ1Y3QgZmlsZSAqZmlsZSkKIHsKIAlzdHJ1Y3QgYW12
ZGVjX3Nlc3Npb24gKnNlc3MgPSBmaWxlX3RvX2FtdmRlY19zZXNzaW9uKGZpbGUpOwogCisJY2Fu
Y2VsX3dvcmtfc3luYygmc2Vzcy0+ZXNwYXJzZXJfcXVldWVfd29yayk7CisKIAl2NGwyX20ybV9j
dHhfcmVsZWFzZShzZXNzLT5tMm1fY3R4KTsKIAl2NGwyX2ZoX2RlbCgmc2Vzcy0+ZmgsIGZpbGUp
OwogCXY0bDJfZmhfZXhpdCgmc2Vzcy0+ZmgpOwotLSAKMi41MC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
