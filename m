Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BD1C43458
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 19:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JwJ5/kXoW2XdEaFEv8DoGHKuXYBYuO42PVg+05vdvVo=; b=cgCS4EYcYMiJMR
	Ho+QBc3+77b/u+FTDuJKs9PIx/hFIwyLwuyEObUspTOCN25EiSgjbrUD3K9rjzCuJqimdUxAddQtW
	6ZJKC/n7ZGRrVYIu5qgIFjsIRTgvEjjotv1yRfnEipZg8yy/eh8A71L9E/cN1dwwhA2+ZMHq8FWi/
	tXFRsWdCQCUf2kyIyyoRfs6MXfnQTcYAWsd+QLg4vGfb7nK07GaZfo139suEUr2Nlcj7m7PClMQtH
	mAfOaiEcOTLE1Uq7CYXBwJPKEhjfTeNTMFb3j/C4QxeBir55CgeTv4lAQY976+IjBraWOBj1OzKF/
	he/t+YhLuABvLGcq8dvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBRm-0000000Fl6b-33ea;
	Tue, 07 Jul 2026 19:27:11 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBRj-0000000Fl52-1GNL
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 19:27:09 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2caced6038eso13286595ad.0
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Jul 2026 12:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783452426; cv=none;
        d=google.com; s=arc-20260327;
        b=iQe8Rq/Fd6nmFn2KBbXxZJ6QTaFJLP7oYX1lHHUgoiqge/Hk/Ge+l1kqZlPaIV9gCi
         EeKVErP4otLDXfQEvaPjnLVEKzeMvfk+bspohdCjT3CU9lEMKJBtqA5Urw5a/0PO+z82
         bY15tVSE5YJth3J1F0y4xbt4Vc4Y77ttxb0QMlo4dH92TW96Cck2eKZRFmjchNDDwJhi
         J0AkNhiMDXHYhU9BQ5VL+moGehqwrVvXgqzftZ7Sig5aNy1F+guq83gYKqXQh2QrCiJT
         wKsnHHIH9FaMIIJCjy6NpezDb+P8Pp/71jKdCGN+fesxV8v+eg6GrNjWYvGZsR0DOCi9
         D3XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UgcC0RVl6Nt6QPS0xW3BWvWsGBqEPSdHq4xCHzzbh+E=;
        fh=3U5s8dWLVv47Zj8ilMwQu1A+gllWqZ8BVCfO0XnYZbg=;
        b=QlzmCyHbNxRKF0ANEL9xsCkn8YF/WIdwgD6skOok+P/1Bt5tDAdVb7wT0UsJ5JI3Av
         sd8QcJcVIX0C5x1PJh1z9hle66u/nZ+RqB03XsauygOZrlUwXuWQyxPVbeG638d1tw4s
         H7+bmUrfeal42iC4Xy8xFQW+QpCuEpmGOYhsfeLZpn1lCP+qAMLqotVgN4b1M1GMBDwn
         82Vbuo2rkRpk5ATHvfWWQahDHLcz+J6qbwqXbVWvOyieXARSqPPsov3hdrIh8KUesGDr
         Hbr8/WmWR+2hHGB4GyZ6QH7+/FY/xx2g9rpanvyMdeEPCP5uPl/Ap3kYgpExVK9KlG28
         8v+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783452426; x=1784057226; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UgcC0RVl6Nt6QPS0xW3BWvWsGBqEPSdHq4xCHzzbh+E=;
        b=j1ad1LKOG5YZSh4a6EHjXdFv2J5SMFblXNjCFe6NYn63bYmj3+cKo7MkJAa/sBxpZf
         mXFVBBzcEjAArOEVxn2satNOcTNqAhSEhd+MJsngx1MTcp3zhFkAODD/GlVV9ama70se
         1cGBQc1Wx39ssrgnwqhHeAae/MtgPkIHVzi+cTYVksCMlXo7ITXHcYs8pDF3vvvTbjVV
         AJtrD00MAhCBWUEMPtTQzgZA7gRMnzixPsu+DzWSmpI2p/NxoKwXct3aQkQiaaEyYM1W
         2YwkSE2Y5ifwW07tDtSXFrGYYi8aCG38O51ylV8nkaJAp+0RcR3MlFQOMGP43OR9Y3fT
         tnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452426; x=1784057226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgcC0RVl6Nt6QPS0xW3BWvWsGBqEPSdHq4xCHzzbh+E=;
        b=VGxtNYtjs1eZlmhHJLFwnpuhVfYC5xdBoTTYVkDKF2jHvCiNnHwVgSidTogoIV7mr+
         3xPjVbZOr8KZQqvxwz2nCZRrMDwov8a7SJZk1mzA9AjG7w/KCNhCIjVMa4xEZydz0Y6G
         DsUYUjATeghJySbp8Krj+6wopnSBCFCurf9BDzEwZ9ysshkf4zzgc+7s7tAueLR0bGZ6
         HNSYPkt/pVMJVwkRpwpeztS6nHXhXjl5SNxGmN9svw/5inwIWH+O9ntrZHgtWLkG2AzJ
         bGc7HrEB/jfP+GI0y5C0Axn/4LiXKvVu3KNKp46JqFBq/DMZgqb4jlvDElT55S2+73wc
         pIQA==
X-Forwarded-Encrypted: i=1; AHgh+RrwkhHaL+RwEXJkUUX72mnfFDkzPh0Lk2lN5EH1vBD5QAeVGbqlKOO7PhBE7fBapSzFTmZUyx+XbrISuOgG@lists.infradead.org
X-Gm-Message-State: AOJu0YyVlZo2p291/lebiD/SyRTsdu8C7YaO9bZMshu3vCwv1DQne/K9
	brtmj2QQKQjT6On+Vuh7rNl4gQ0qxeIL0OeGibmKZjkC7gMdEy/dNqqax4yRomVbN5ci7DmYQD1
	5OgY7wd1aAr1/PxXqvYCwoP/24Od0Qmw=
X-Gm-Gg: AfdE7cnXnJBVoZOUG3bXc2sHYAKGC0liol03WCpMdtWymQN+7BIG6BI4h92K/ZowF0i
	eOxJcxuuHmWmj661MhrJUzC2NeN5YidW9w1Zlf7kSzDhSPDm5G9HEjs2XpIdmd+UsAktROyeib7
	efX7N9EUBtHA1Hn4ROeetWd502ZsR6UX7CLMqBEVCxgz3r3pk2HziIwPuuHdUyK00NanHf6UzZR
	/PNLmyXlnXJv9myympTIX6Ea0zwBIXmkpkTN8BBALvU9BV4cIm+AFiBDTuzYngAFTfKeepWenl2
	1fricFxevXu/juEayndGaLzo6A==
X-Received: by 2002:a17:902:e885:b0:2cc:841d:cd7e with SMTP id
 d9443c01a7336-2cccad9693fmr37869045ad.21.1783452426303; Tue, 07 Jul 2026
 12:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com> <20260706-a9-ir-v1-1-4f082ca8aaf1@amlogic.com>
In-Reply-To: <20260706-a9-ir-v1-1-4f082ca8aaf1@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:26:54 +0200
X-Gm-Features: AVVi8Cc4p_QHwDWk0aEYAh_2ulyl2XezrYxvB4AQz2uBN1snV01ZmTjZPjn_E3M
Message-ID: <CAFBinCCv-pUivmW4_O5veamSQBApmTvbyGSrOBr14tsg4yf8bQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: meson6-ir: Add Amlogic A9 IR compatible
To: xianwei.zhao@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_122707_335799_F056DC03 
X-CRM114-Status: UNSURE (   8.48  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdWwgNiwgMjAyNiBhdCA0OjQz4oCvQU0gWGlhbndlaSBaaGFvIHZpYSBCNCBSZWxh
eQo8ZGV2bnVsbCt4aWFud2VpLnpoYW8uYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4K
PiBGcm9tOiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPgo+IERvY3Vt
ZW50IHRoZSBBbWxvZ2ljIEE5IElSIGNvbnRyb2xsZXIgY29tcGF0aWJsZSBzdHJpbmcuIFRoZSBB
OSBJUgo+IGNvbnRyb2xsZXIgc2hhcmVzIHRoZSBzYW1lIGltcGxlbWVudGF0aW9uIGFzIHRoZSBN
ZXNvbiBTNCBJUiBibG9jaywKPiBzbyBhZGQgImFtbG9naWMsYTktaXIiIHdpdGggImFtbG9naWMs
bWVzb24tczQtaXIiIGFzIHRoZSBmYWxsYmFjawo+IGNvbXBhdGlibGUuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KUmV2aWV3ZWQtYnk6
IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
