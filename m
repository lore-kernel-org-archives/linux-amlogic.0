Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB91C43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 12:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNHXu0EEyJH7Idw+puz3Al7p/PwXpC7Oaq7jH+RPgKs=; b=3nXVMKd0wdzNKS
	SVNiO8/Y82saCZVBW9uX+Me7At0dbqMvE9N/xodf8euIZfFm2MvrnLdDSri1uhj/CSt2Yu3pUo5Gr
	kY8ZaSv0IeHXSUVv3G64s4IxmM3gvZy9oMUxQjVjetA3rTXLtD7I2CUavXhQxdfL/RtHaq2JxqZiu
	++r9cK5mpPExj70e/LFAFIdt0vgof1GJu66FpQtuDRGKFNK/af8x+4K5ExZC8ddqNBOENfaYK4nSF
	Mr1sfyyDaHW4nUo9GzDbXpwMhA+0dXeJlKtbBRPmuvtM47qPCdH79OK8qeTVM7R9yiUDHNuLESCtj
	x9ibWZMnL7X70zK4y6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVm-000000099jM-2q88;
	Mon, 13 Jul 2026 12:11:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVa-000000099Zd-274p
	for linux-amlogic@bombadil.infradead.org;
	Mon, 13 Jul 2026 12:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PKJfzcOO3DPVFtYYdFmzNXMgq4lw0a0uxvJDNfRGA24=; b=Tehc+RxSMb5Rq2SZGquuPJpnv0
	qwaTk3GaqTkkoLdYtCv4QnGa4rSRVMP49DD4bZinyk9fb5mNccxwYfI7kKa+IWiJ3QWvAYT0J209M
	o2pcmSWPydzhWYT6/Z/acpEkVe235t7xkt2yLpqUk3JgMuTitphEfo9WjRey+sTMVepW/ZJmcxPY+
	eECIZaGiSlx60FSVDxCHlB47zjXi+BMcsr0lMt8JUczmpPriCw2dP5PlJ7dFJRShBBCsbxOcWXCsG
	Mr51nqJj7QNVuwy1uG7+y2jNZpHjHvGnDq8hKgOWydOXuztzvisi2usbhpq6KRHdh1ub9OpkcEJx2
	b7zq0dnA==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjFVX-0000000BaYi-0pl7
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 12:11:37 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-381216921aaso3398456a91.1
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 05:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944692; x=1784549492; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PKJfzcOO3DPVFtYYdFmzNXMgq4lw0a0uxvJDNfRGA24=;
        b=Iyp+QIaFz89H0yfPrDgJRlystJXYjhFEiJcf/RcShHBcxULXKwtj4K2ADa/IQzrgru
         3BbLtJznz8/XjWjdtb34mVWHPLeCTRDRffb0zmRhuRgIqDfN294YzYbv/LDdMF3Mkbq+
         SEPVIVQJWOGH0U/KY/OLLJUyf6s7qthsNijc1q38U2Qzt/eIyGxdhe5/iLnQvdlkR1h/
         g4N9J1y48WLK29JCCBJJl3oFmg4QcOMa808QMNlkUnpd2m/MjRuLtAquQSiYEkJSxoMA
         NzelZbVd2KxpDSU21nwqz7Assh6SEsLJU09sVZ3qSYizKLttynkXpM8ulFs2PDpt3O2B
         WYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944692; x=1784549492;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKJfzcOO3DPVFtYYdFmzNXMgq4lw0a0uxvJDNfRGA24=;
        b=UGWYAJAwhzQc81EtZ9RDsOPwwUAKLu1C0xwntGoioQxMNBA1gbz85UmCZPdIOshdxg
         AASVyD0+6TlkYCznVkIHtM9qDlflDBg0SMela4l4ixkaSjXMajPsh++h0KzpG4uEVUht
         0yMErvPz7uthHT9er8oLusf3qoBWV9Da/X6IsjaBwz21J2advd2c/f21XWlhEwqcdu5N
         nALS0nEEwWKZohmG0Ytt4LZ1M6PuJqL8sQ2ezuaKSMEkt7R4/zSSDEQTqVUnA2U9jnYe
         sExHZ44HqxMOMEqUhiybDLM3mOzORJXHrmLhxXa3WkKLkWFWi8cXOjle7P/plnG54CM6
         qV6g==
X-Forwarded-Encrypted: i=1; AHgh+RrinVgkYWPlJTZpOHaG8d6zovC37yhr8D/koui/BYlxjyp+UqwovHIVShyeQ8KXhaYB21iC7gEJBaSsXJHQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyKg/ghApbKMS/yEjWYeXV08AIgIJPzMIEhZdDc2tnNHNuMHJor
	jejLG16VNhF1viSKK+QaIJNZTXp4+U30syIQVzrA3m5u5VxLQcWosD4O
X-Gm-Gg: AfdE7cmUIu/xntPBmqBlUOQB4z6LGlt6XgAuMP0VYFPM0WkObvcy5m+7Lx0eCtViId0
	PfAU8bBXwV3awUL8MNYLnTktKSTbJQWjjgHCnMaPEgHd9jdm/6eGKHyB6y34kPyX8PWjZYWu62k
	SEXelt68SUGuTTqD7faOVvU64+C3CMDqgu614zGXXqGNRKHXsD7jVlvFDPSdiMr971hT8yZG1he
	MY+d29meULdKzPkg1zUphY45Rj7xbL1OXAsC5CyuPjvJKU8gGlTrRq/256rJu7jQUzRCCc/MEwz
	IjUgDyaSuwVDuuRVzZ1o22Xf2mb91EENv56bB5ekk2aSiqC13gZSc9Tum4Au4bK60jSgStLJrB2
	eO2Vwg8J2FocfujaswFpMXvMVtPsk2TdD4VW2ETZ+1a/DxJWUyWknzgAeFXuIWnperC6113ifpV
	KQES/CU2yfdg==
X-Received: by 2002:a17:90b:180c:b0:38e:fbe:b67b with SMTP id 98e67ed59e1d1-38e0fbeb818mr766655a91.0.1783944692422;
        Mon, 13 Jul 2026 05:11:32 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:31 -0700 (PDT)
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
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v7 15/19] media: meson: vdec: Fix concurrent firmware loading race and hardware timeout
Date: Mon, 13 Jul 2026 17:37:10 +0530
Message-ID: <20260713120840.17427-16-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_131135_413131_B4D3CB5D 
X-CRM114-Status: GOOD (  14.41  )
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
Cc: Doruk Tan Ozturk <doruk@0sec.ai>, Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIHZkZWNfMSBmaXJtd2FyZSBsb2FkZXIgdXNlZCBzdGF0aWMgdmFyaWFibGVzIGZvciBETUEg
YnVmZmVyCmFkZHJlc3NlcyAoYG1jX2FkZHJgLCBgbWNfYWRkcl9tYXBgKS4gVGhpcyBtYWRlIGFs
bG9jYXRpb25zIGdsb2JhbAphY3Jvc3Mgc2Vzc2lvbnMsIGNvcnJ1cHRpbmcgc3RhdGUgd2hlbiBt
dWx0aXBsZSBkZWNvZGVycyBsb2FkZWQKZmlybXdhcmUgY29uY3VycmVudGx5LiBVbmRlciBzdHJl
c3MgdGhpcyB0cmlnZ2VyZWQgS0FTQU4gcmVwb3J0cywKbG9zdCByZWZlcmVuY2VzLCBhbmQgbWVt
b3J5IGxlYWtzLiBNYWtpbmcgbWNfYWRkciBhbmQgbWNfYWRkcl9tYXAKbG9jYWwgdG8gZWFjaCBs
b2FkIGNhbGwsIGVsaW1pbmF0aW5nIGNyb3Nz4oCRc2Vzc2lvbiByYWNlcy4KClRoZSBmaXJtd2Fy
ZSBETUEgY29tcGxldGlvbiBjaGVjayBhbHNvIHJlbGllZCBvbiBhIHJhdyBkZWNyZW1lbnQKbG9v
cCBvZiAxMDAwIGl0ZXJhdGlvbnMuIE9uIG1vZGVybiBDUFVzIHRoaXMgbG9vcCBjb21wbGV0ZWQg
ZmFyCnRvbyBxdWlja2x5LCBvZnRlbiBiZWZvcmUgaGFyZHdhcmUgc2lnbmFsZWQgcmVhZHksIHBy
b2R1Y2luZwpmYWxzZSAiRE1BIGhhbmciIGVycm9ycy4gUmVwbGFjaW5nIHRoZSBidXN54oCRd2Fp
dCBsb29wIHdpdGgKcmVhZGxfcG9sbF90aW1lb3V0X2F0b21pYygpLCAgcHJvdmlkaW5nIGEgYm91
bmRlZCwgbWljcm9zZWNvbmQKc2NhbGUgcG9sbCB3aXRoIHByb3BlciB0aW1lb3V0IHNlbWFudGlj
cy4KCkNjOiBOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzQG5kdWZyZXNuZS5jYT4KU2lnbmVkLW9m
Zi1ieTogQW5hbmQgTW9vbiA8bGludXguYW1vb25AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvc3Rh
Z2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWNfMS5jIHwgMTYgKysrKysrKystLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjXzEuYyBiL2RyaXZlcnMvc3Rh
Z2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWNfMS5jCmluZGV4IGE2NWNiNDk1OTQ0NjUuLjI3MzYz
YzlhNWFmM2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3Zk
ZWNfMS5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWNfMS5jCkBA
IC0yOSwxNCArMjksMTQgQEAgdmRlY18xX2xvYWRfZmlybXdhcmUoc3RydWN0IGFtdmRlY19zZXNz
aW9uICpzZXNzLCBjb25zdCBjaGFyICpmd25hbWUpCiAJc3RydWN0IGFtdmRlY19jb3JlICpjb3Jl
ID0gc2Vzcy0+Y29yZTsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBjb3JlLT5kZXZfZGVjOwogCXN0
cnVjdCBhbXZkZWNfY29kZWNfb3BzICpjb2RlY19vcHMgPSBzZXNzLT5mbXRfb3V0LT5jb2RlY19v
cHM7Ci0Jc3RhdGljIHZvaWQgKm1jX2FkZHI7Ci0Jc3RhdGljIGRtYV9hZGRyX3QgbWNfYWRkcl9t
YXA7CisJdm9pZCAqbWNfYWRkcjsKKwlkbWFfYWRkcl90IG1jX2FkZHJfbWFwOwogCWludCByZXQ7
Ci0JdTMyIGkgPSAxMDAwOworCXUzMiB2YWw7CiAKIAlyZXQgPSByZXF1ZXN0X2Zpcm13YXJlKCZm
dywgZnduYW1lLCBkZXYpOwogCWlmIChyZXQgPCAwKQotCQlyZXR1cm4gLUVJTlZBTDsKKwkJcmV0
dXJuIHJldDsKIAogCWlmIChmdy0+c2l6ZSA8IE1DX1NJWkUpIHsKIAkJZGV2X2VycihkZXYsICJG
aXJtd2FyZSBzaXplICV6dSBpcyB0b28gc21hbGwuIEV4cGVjdGVkICV1LlxuIiwKQEAgLTYzLDEx
ICs2MywxMSBAQCB2ZGVjXzFfbG9hZF9maXJtd2FyZShzdHJ1Y3QgYW12ZGVjX3Nlc3Npb24gKnNl
c3MsIGNvbnN0IGNoYXIgKmZ3bmFtZSkKIAlhbXZkZWNfd3JpdGVfZG9zKGNvcmUsIElNRU1fRE1B
X0NPVU5ULCBNQ19TSVpFIC8gNCk7CiAJYW12ZGVjX3dyaXRlX2Rvcyhjb3JlLCBJTUVNX0RNQV9D
VFJMLCAoMHg4MDAwIHwgKDcgPDwgMTYpKSk7CiAKLQl3aGlsZSAoLS1pICYmIGFtdmRlY19yZWFk
X2Rvcyhjb3JlLCBJTUVNX0RNQV9DVFJMKSAmIDB4ODAwMCk7Ci0KLQlpZiAoaSA9PSAwKSB7CisJ
cmV0ID0gcmVhZGxfcG9sbF90aW1lb3V0X2F0b21pYyhjb3JlLT5kb3NfYmFzZSArIElNRU1fRE1B
X0NUUkwsIHZhbCwKKwkJCQkJISh2YWwgJiAweDgwMDApLCAxMCwgMTAwMDApOworCWlmIChyZXQp
IHsKIAkJZGV2X2VycihkZXYsICJGaXJtd2FyZSBsb2FkIGZhaWwgKERNQSBoYW5nPylcbiIpOwot
CQlyZXQgPSAtRUlOVkFMOworCQlyZXQgPSAtRVRJTUVET1VUOwogCQlnb3RvIGZyZWVfbWM7CiAJ
fQogCi0tIAoyLjUwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
