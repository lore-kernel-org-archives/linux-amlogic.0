Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8616AC6FA99
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Mar 2023 22:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v09RUP6InN84SSn3B3z+CDs29IbfGPuBpHRige0DrJ4=; b=W+0PFt0VTVwRi8
	VLmMskXcgfn9jJqGmzdAEwklB9LzKf1bnOJkPQK68ISu8asqnKaUdzRv8twxc5T4JG+F0Iw66TRZq
	Ev9jo4csISp4pOsAcva8t5mnPTv+LbGVDwxn+X1ownmzRGOZ4QE49ZZ/vWB9f2k/TFPBsw4XTNAEu
	4S+SV+HDHfffy19TlyKqIrgpe1WIlVMkfFPpiXtWGCS1Pv9sXOFE1e4Ok19HXJs0Hk4pkVLxcL54b
	ZiNCFpIta/VSJm+EIXKHwWVuJQfXvMj3Zp2gBU9DRAVNolJm8PVvY/JGWd63KwF5eOx0ZFZe/jLS3
	IdwkECz+0ZHY3A6cWHwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palXd-00GV5d-9e; Fri, 10 Mar 2023 22:48:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palW4-00GUHl-Kz
	for linux-amlogic@bombadil.infradead.org; Fri, 10 Mar 2023 22:47:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=BSow9olcoHPDQWGX+9sZKUw+pImGguqL+rxp9AEhbQU=; b=MyOP981166g4oYf3wZ98/4E94z
	SoJTSGsKDUyPfYslsMZtb8f6g1TquRE6HpXoJFmN9YtbK2lfYSHLzsaIM+zoOFVv3xw60Gne0s1IY
	VcjGUA+Iozb5/e2o5EZmC0xYLP50elsqqFdhlbNFiH7GmAm5cXh3MUs9S8DoCUzVr+POWtvUQG1id
	OFHpyA5dLEbJrzCynYTxv0vAEY7u3Ug7RmQxaeFXrFBjM+sUBa3NMpnjMysvV1ZxWTEp0TSkH6rNd
	Lmbtz6pzJD5zS83i6a48S8WydWKYDcUR92Nxn7fgRc8pv+n3SBDuZgiaqEro5QyLJI/9qbEbquCCH
	kRdZu9XA==;
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1palEc-000ap1-21
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Mar 2023 22:29:13 +0000
Received: by mail-ed1-x52d.google.com with SMTP id i34so26420642eda.7
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Mar 2023 14:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSow9olcoHPDQWGX+9sZKUw+pImGguqL+rxp9AEhbQU=;
        b=WMD94TIdueIJwD4R0dzXoVlrA+lBE3XxCJOkt5lcGwJl3T9aSx5oXLSImUAdS8gGWj
         nevEWuDRfJ5RPH0TtzsEO8S3/WbblgN6c7T0caLdrg4JVyKOqAgZy1gYCF24w5rLBjjL
         MGSsSfrwG4aZGC+l8fhUpOJRtBywlP3akFV3IGOYCLF3G4b5n7kiyAbJDLHKhRR8a7LS
         Z2ZsSKJ0xALhO2Jtv+CXbxq0jXTpVzfN+2istoSvNEtpe8cznSwbbzPN3KeRr/R4kSF7
         IFSRNgff5R+GmFDJEXkLP5PhiObPKCY/RCtarbKc44EdzHR0zp2QleIG+ceGsJi5jxoD
         dz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSow9olcoHPDQWGX+9sZKUw+pImGguqL+rxp9AEhbQU=;
        b=b0EQOBMR8GFg5+95SogMCp9FAED+hjZuGkZRM8jQ91DnIl/XAqXhUH9JoKZAQGBdU+
         Bnd4Bh8zsTRWhgQUfT9kSwHAIlrHTaR9WqzkzWxxW65dAReGFUz/itLhpCZQ4MNsTMuB
         7TbQ0Ks2zkcnMqwMfQDafJObTRP8HFCaT6wUfeANzz6GwhnbUHqOlVaiok99T08dVPwm
         8EnebKTL4/8HZiu3/iiTVgukbadOQk8CKzGKDVVyLZU28xSJqFy2f0mI5cMe2V3Wb6xE
         gSS5g9KAeN/5YSlEwg1/Huapi4FNQ9vvODURsrwQF8XnNamklfpt0m22rYIM3J9I24Ab
         EbCw==
X-Gm-Message-State: AO0yUKUiachXqdxLQf+IfQ1I7v/GntPjd9jR3uJJgV3+tprcaQ73XdTF
	laxg6H+cZgpk7nTFwYjUUmm4Nw==
X-Google-Smtp-Source: AK7set+ZEfdl5RMmf1uVdzsphu0VuJcqw6uo7c4Au9pdNtDAtzSnz6tjiqyq5MBaqY6lf3+ZmyTllQ==
X-Received: by 2002:a17:906:8156:b0:886:221b:44e5 with SMTP id z22-20020a170906815600b00886221b44e5mr26872458ejw.62.1678487348858;
        Fri, 10 Mar 2023 14:29:08 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andi Shyti <andi@etezian.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 07/16] spi: s3c64xx: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 23:28:48 +0100
Message-Id: <20230310222857.315629-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_222911_306703_C973C9CA 
X-CRM114-Status: GOOD (  15.03  )
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

VGhlIGRyaXZlciBjYW4gbWF0Y2ggb25seSB2aWEgdGhlIERUIHRhYmxlIChhbGwgcGxhdGZvcm1z
IGFyZSBPRi1vbmx5KQpzbyB0aGUgdGFibGUgc2hvdWxkIGJlIGFsd2F5cyB1c2VkIGFuZCB0aGUg
b2ZfbWF0Y2hfcHRyIGRvZXMgbm90IGhhdmUKYW55IHNlbnNlICh0aGlzIGFsc28gYWxsb3dzIEFD
UEkgbWF0Y2hpbmcgdmlhIFBSUDAwMDEsIGV2ZW4gdGhvdWdoIGl0IGlzCm5vdCByZWxldmFudCBo
ZXJlKS4KCiAgZHJpdmVycy9zcGkvc3BpLXMzYzY0eHguYzoxNDk2OjM0OiBlcnJvcjog4oCYczNj
NjR4eF9zcGlfZHRfbWF0Y2jigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2Vk
LWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL3NwaS9zcGktczNjNjR4
eC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLXMzYzY0eHguYyBiL2RyaXZlcnMvc3BpL3Nw
aS1zM2M2NHh4LmMKaW5kZXggY2M2OWY4ZmZkYmRjLi43YWVjNDk2MDcwZTIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvc3BpL3NwaS1zM2M2NHh4LmMKKysrIGIvZHJpdmVycy9zcGkvc3BpLXMzYzY0eHgu
YwpAQCAtMTUyNiw3ICsxNTI2LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgczNj
NjR4eF9zcGlfZHJpdmVyID0gewogCS5kcml2ZXIgPSB7CiAJCS5uYW1lCT0gInMzYzY0eHgtc3Bp
IiwKIAkJLnBtID0gJnMzYzY0eHhfc3BpX3BtLAotCQkub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRj
aF9wdHIoczNjNjR4eF9zcGlfZHRfbWF0Y2gpLAorCQkub2ZfbWF0Y2hfdGFibGUgPSBzM2M2NHh4
X3NwaV9kdF9tYXRjaCwKIAl9LAogCS5wcm9iZSA9IHMzYzY0eHhfc3BpX3Byb2JlLAogCS5yZW1v
dmVfbmV3ID0gczNjNjR4eF9zcGlfcmVtb3ZlLAotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
