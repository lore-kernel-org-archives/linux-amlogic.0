Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E54606A329
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Nov 2026 20:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AnpI5zNb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=CpJ3qOu5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RM0vapK3/zqcemYJqiLa/WLuZvqoU4uOu4SUmATFktM=; b=AnpI5zNbdpkDwB7O1c5y5CHDh/
	NGkcCN1V4y95s6LSmU1eE7mf0vnOUUbWOvZuZZGZsKyoKJYVldzc9KVJHdUSce9Dlchn8y3ucJt+u
	t1TOxCzepD1OSqgIu4A6sJryg3jo+GpWxr8w5MZRnQNgo2b7lPyu4R96pOM3wH1X9Q+btkRyzQj1y
	dMDeW2/Gw2ROXT+Sqkhu1MyNxjUZoAa9uxbAn+3uoG7KOeR1e+aS+3nwRb448fgEC2huxBluBu3KS
	yCo0w9EqXYUTOcIEim+rCrlRI/cnvReEEIr9tDvkAcJ19lU2u6sXWwMbshE95IhF0iKZrRhSPOAcJ
	7jkjsdPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxTY-00000007moY-2lla;
	Tue, 24 Nov 2026 20:50:52 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxTV-00000007mnA-3E0I
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Nov 2026 20:50:52 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-8b0d126f631so43195017b3.2
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Nov 2026 12:50:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553448; cv=none;
        d=google.com; s=arc-20260327;
        b=paavmbG5IAQO7+JdDGAD2niGeGpNESNkeMO5Wb9pG18ivY8qz+cgp1ydb/NxT4ZGiX
         GTckhmi5pOYuN8Gmdu56xV0/4ClqhonWy/y9jpXM4IJ5GEq2FwSgPWadO3E+Ryjdxjk8
         Sr/c/kSPj0q3qjbyk8hKTA2VjJTsISXKvOblpsLouUrj9zVfogQHHU7B/5e3lCy00795
         k67lRUoAiXoiMZMtDlbFXY2ZvgK8H6TlI399u6cO8SA40QA+H0LFZw+V7dPEERL5o//P
         01IhaaQv+TVO1ul6YxFINzCyETF6T56+U6MKJ1nXhSzEXz+EiBd8JDVh+VffMysX8cQp
         iBMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DUElJOH9/l+/ko03UyVUdQyQrHZyxIkiDH011xj2Lsg=;
        fh=C+LGc1RBm5tF5fKBYszMZ68K3IvrvGOgMpsjbmEiPm4=;
        b=mH057d3KWBP0OH7HS93Ya53UGrHcW2VUi5S2ohfOOhmrr4z9GDrqCH08GZAw/L97jd
         W5WybA+TBSOpcEmstG6aLIxPmIbV4TVhsc3QUmV8BmwZFGUtIMdHTi0ktKFvHpNC8esY
         Qo/DzrnILiOdPsSXx2tSKSxEN4JLLmIBDU9f2Cnohjs7faHDGelDvAWlXXrbtO8oKbh0
         q7kGO+9TPRtvwPDUY2RIJ+3L9TyIiDErZ6Fc34mN3cSBsPry6DX3+vH26VzqctukPu9r
         3wmF2OpLHpha+rOgGPHelU5S2PRNyk8esYLydTQo9z94/hI8kU/PwG/UOPzmbfsuCkDH
         7kSw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795553448; x=1796158248; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DUElJOH9/l+/ko03UyVUdQyQrHZyxIkiDH011xj2Lsg=;
        b=CpJ3qOu5I2nSmIwepb6X0oT5QEEQJeN/cQbUHDnepVXroOOSrL7R+pujvt14GJBsDG
         JxI0wRE1lhM4QZFReBh1gQKsViR0iutBJYPAdeKr9Z3I12CfMsfcMXKip32SeGD0FMj0
         ATHWbIA28VPQSB9VEUrRR/1UjzezPSnD3y4ejb6SgplPZhw+9OTrdP8ulj/kGfTTwfdQ
         hlk/rVfage6H+he7Ha92VKffn6otthTvjgx3ypw7pwjholXwK5POIz1Dch2l5VM/K8BY
         PJ39oWa8xdyQ4zmu/9RCYm5+RkCb4hEdpyN4nG51RPh/dEjOFjTAh73Es/PHsvi1RyjR
         J8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553448; x=1796158248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUElJOH9/l+/ko03UyVUdQyQrHZyxIkiDH011xj2Lsg=;
        b=eudtKPM2WGbyKVRFKYlp915MqDRZsmX6pvtkO8BGqxAfHQt3NFIjCnhnoUMPnbgrEX
         UXVyPDRcE6sh4V7CrzzQI4OJ+QKrScjUqNSlXF5fRl5hUF9ukcuFBr/rJrgT59LYaYDG
         dyBZRDTceEMIyDQ1EXJ5nUlpBGehcaR7dqxIDhTIhLNdAhRUAKB2EvfghJIKxYf6xc3a
         yRGEu73IKoZLGcv8KrgRzbKZoa/PhtuY9zs1WFxNtxJ28YxBkxoXbAxKGfA//SsvLAyN
         wKv45SBN3mTsFgcdbTs7rAkbPI8sKKA+iBA/SBFRg/af9TXi/eoKMmfn5J9SBWcaR7JN
         +Wtw==
X-Forwarded-Encrypted: i=1; AL+hErEEIebnb6g0PhYaoYuLRiPBOEcr8RU39r3gwwL2VJUXdROjqXZ2zRBvT7BgMSnLzRz9J49OLdDMAaYCjLCb@lists.infradead.org
X-Gm-Message-State: APuU4Z8ueAONk932R1sDj1VjxGMLlVICbpHwS5vh3g53MiqzuSamTDRB
	03XPFY88NXfJqSCvZ0HrMgVRXQLd+fkvQscqGCesGEiYOHAhNZvYkkz6ZSd91Hf4VLHiANrfpS3
	DqtIlx0T3Ho9JsSL6RCrArk/0pvviDkYH9y0f
X-Gm-Gg: AZFdTZe9A7UsIfHi2keMj/+YltTchBHMbfJ+179ANtrcrn4xLbn+gmxj8hvL6V6XDY4
	x68YfdhSveFDr12po6tk4D4Hs+GPcMBhNtH5fS9zQg+zrv5ltA1AKIOHuq4RFVZs84AMfjpSiaG
	U+dY0fWcnwp/Sf3eKVeEONLLPQ4WSbMRU2xnuIQDH6ta7guIzkAKkNJbyTYprAP7sDF+AqJbGTO
	mmpjduc62DNio5N4hsOGYRiNBUdw/NewgzXUeP1/X8BX+hQCeyWNuQxq7K3mT6P3ZdLP3Hl5rKO
	gRvZto+Ei+58P8aZno4N07gu/rgFzlMM2HChSqmNhPdPgXO3Mc2akRBpQK+/GJ/iWnlakseR4/7
	U76yr2BxwBecicY+zgDQ0a3vVzZrJR8bS/xazqnTCfR2jF1H+rpXGFqzIpiO7k2+ZVvu4eBdIt1
	eQrOJZinlqudvL4Ps=
X-Received: by 2002:a05:690c:9c02:b0:8b2:bb94:8cb2 with SMTP id
 00721157ae682-8b5204ac257mr64922377b3.35.1795553448224; Tue, 24 Nov 2026
 12:50:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117-g12a-mux-data-path-v2-1-fc56db5973af@iav.lv>
In-Reply-To: <20261117-g12a-mux-data-path-v2-1-fc56db5973af@iav.lv>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 21:50:37 +0100
X-Gm-Features: Aa3M54qQgZtHIRJ2rEKu9YwpwMfEmR_bHT9xQyRDCd8xOxY9i9IjLVm41ypmXlU
Message-ID: <CAFBinCALe-8oB5Mwpyx-B_7dKJ-WZcMCjycHv=xH+JasRBOaPw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: mdio: mux-meson-g12a: keep the MAC data path
 when switching MDIO
To: iav@iav.lv
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_125050_173994_DD1A342B 
X-CRM114-Status: GOOD (  16.08  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSWdvciwKCk9uIFR1ZSwgTm92IDE3LCAyMDI2IGF0IDE6NTTigK9BTSBJZ29yIFZlbGtvdiB2
aWEgQjQgUmVsYXkKPGRldm51bGwraWF2Lmlhdi5sdkBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEZy
b206IElnb3IgVmVsa292IDxpYXZAaWF2Lmx2Pgo+Cj4gU3dpdGNoaW5nIHRoZSBtdXggdG8gdGhl
IGludGVybmFsIE1ESU8gYnVzIHdyaXRlcyBTTUlfU1JDX01BQyB0b2dldGhlcgo+IHdpdGggVVNF
X0lOVEVSTkFMIGFuZCBSWF9DTEtfRVBIWSB0byBFVEhfUEhZX0NOVEwyLiBUaGUgbGFzdCB0d28g
bW92ZSB0aGUKPiBNQUMgZGF0YSBwYXRoIGFuZCBSWCBjbG9jayB0byB0aGUgaW50ZXJuYWwgUEhZ
LiBPbiBib2FyZHMgd2hvc2UgTUFDIHVzZXMKPiBhbiBleHRlcm5hbCBQSFksIGFueSBhY2Nlc3Mg
dG8gdGhlIGludGVybmFsIFBIWSBzdG9wcyByZWNlcHRpb24gdW50aWwgYW4KPiBhY2Nlc3MgdG8g
dGhlIGV4dGVybmFsIGJ1cyBzd2l0Y2hlcyB0aGUgbXV4IGJhY2suCj4KPiBwaHlsaWIgc3VzcGVu
ZHMgYW5kIHJlc3VtZXMgdGhlIHVuYXR0YWNoZWQgaW50ZXJuYWwgUEhZIGFjcm9zcyBzeXN0ZW0K
PiBzbGVlcC4gc3RtbWFjIHNldHMgbWFjX21hbmFnZWRfcG0sIGFuZCB3aXRoIFdha2Utb24tTEFO
IGluIHRoZSBNQUMKPiBwaHlsaW5rX3Jlc3VtZSgpIGRvZXMgbm90IHN0YXJ0IHRoZSBleHRlcm5h
bCBQSFksIHNvIG5vdGhpbmcgc3dpdGNoZXMKPiB0aGUgbXV4IGJhY2suIE9uIE9EUk9JRC1IQzQg
KFJUTDgyMTFGKSwgYWZ0ZXIgc3VzcGVuZC10by1SQU0gd2l0aCBXb0wgaW4KPiB0aGUgTUFDIGFu
ZCBhbiBSVEMgd2FrZXVwLCBFVEhfUEhZX0NOVEwyIHN0YXlzIGF0IDB4MjYwIGFuZCB0aGUgTUFD
Cj4gcmVjZWl2ZXMgbm90aGluZyB3aGlsZSBUWCB3b3Jrcy4KPgo+IFdpdGggdGhlIE1BQyBvbiB0
aGUgZXh0ZXJuYWwgUEhZLCBTTUlfU1JDX01BQyBhbG9uZSBpcyBlbm91Z2ggdG8gcmVhZAo+IHRo
ZSBpbnRlcm5hbCBQSFkgSUQgKDB4MDE4MC8weDMzMDEpIHdoaWxlIFJYIGtlZXBzIHJ1bm5pbmc7
IGFkZGluZwo+IFVTRV9JTlRFUk5BTCBvciBSWF9DTEtfRVBIWSBzdG9wcyBSWC4KPgo+IFNldCB0
aGUgZGF0YSBwYXRoIGJpdHMgb25seSB3aGVuIHRoZSBQSFkgdGhlIE1BQyBhdHRhY2hlcyBzaXRz
IG9uIHRoZQo+IGludGVybmFsIGJ1cy4gTG9vayB0aGUgUEhZIHVwIHdpdGggZndub2RlX2dldF9w
aHlfbm9kZSgpLCBhcyBzdG1tYWMKPiBkb2VzLCBzbyBwaHktaGFuZGxlIGFuZCB0aGUgZGVwcmVj
YXRlZCBwaHkgYW5kIHBoeS1kZXZpY2UgYWxsIGNvdW50Lgo+Cj4gRml4ZXM6IDcwOTA0MjUxMDRk
YiAoIm5ldDogcGh5OiBhZGQgYW1sb2dpYyBnMTJhIG1kaW8gbXV4IHN1cHBvcnQiKQo+IFNpZ25l
ZC1vZmYtYnk6IElnb3IgVmVsa292IDxpYXZAaWF2Lmx2Pgpzb3JyeSwgSSdtIGxhdGUgdG8gdGhl
IHBhcnR5LgoKSSBoYXZlIGp1c3QgcmV2aWV3ZWQgTHVjYXMgcGF0Y2ggWzBdIHdoaWNoIGFkZHMg
RXRoZXJuZXQgc3VwcG9ydCBmb3IgdGhlIFQ3IFNvQy4KSGUga2VwdCB0aGUgaW50ZXJuYWwgTURJ
TyBtdXggcGF0aCBkaXNhYmxlZCBieSBkZWZhdWx0LCBzbyBib2FyZHMKdXNpbmcgaXQgd2lsbCBo
YXZlIHRvIGVuYWJsZSBpdC4KSGF2ZSB5b3UgdGVzdGVkIHRoYXQgYXBwcm9hY2ggYXMgd2VsbD8g
SWYgbm90OiBpdCB3b3VsZCBiZSBncmVhdCBpZgp5b3UgY291bGQgaW52ZXN0aWdhdGUgdGhlIHBy
b3MvY29ucyBvZiB5b3VyIGFwcHJvYWNoIHZzLiBMdWNhcycKYXBwcm9hY2guCgoKQmVzdCByZWdh
cmRzLApNYXJ0aW4KCgpbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy8y
MDI2MTEyMTIxMzEwMi4xNDMxMzAtMS10YW51cmVAbGludXguY29tL1QvI21hM2IzMjUxNDdkNjI3
N2M0ZDk1ZGZmODNjZjViZmNiNzVjMTQ3N2QwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
