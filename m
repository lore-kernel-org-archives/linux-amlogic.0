Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966C860A381F
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 16:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TEqMrJVD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RePO9//G0BaVIO82sY5izXeHprWueRwsj3dZ5O4rH5Y=; b=TEqMrJVDVF7kS2uw5qav2IlqTw
	xBv07UU3/I0rjh0p872UhpVaLmbNvZvLuw0sZsvacOcL1eP0RTXZswwqQ95ir7W2BV8RX6Nbs3v5f
	TffBc8l34GE167IfC6q3U0veRP8/1QagPcQv4mZxb6lH94RCB38YwtGd3mCrcvgsHRnwGHxQMAH1M
	xfJQjzlIsMEdUht5LFRV5Mn3O4SmLY2sMtBK7DmGJDZLtTSE1ydmbMvyOXpV+LgW41QcQfl1eKc/R
	k4aQkWimifrg28uqpXT8+snTvuz+h698IjU0vCN20j5Nllub2IoTm38ulD4dnSMC0hwH6FP00xzhx
	dZceFGtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHXk-00000003B6N-1upx;
	Tue, 03 Nov 2026 16:39:28 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHXW-00000003Awi-28Zm
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 16:39:27 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-483c607ccb4so2508100fac.0
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 08:39:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723953; x=1794328753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NZvArZdYg853Maan0dEAeuUTGOiHnQbpO25gEe5B+E=;
        b=xDqsTSC60Kj9GiSPgvyhE8zeNHXfChuNQ5j6M2IoJGcAfOK/Ljx6FcHf1kFPN+672K
         hhYWxxipbzmiyQyMwOsk5WFMQAdTTbeno70meKQAPOsCbJviNljiszD3ES9RIYIIHtV1
         2+lY7iN3g+Xe6XWENOzAWA/dRl90zjSa7nwnu6PpgLjS3zLnOZTRLMep6aYGIOLIz04K
         H8v17mgStZLpYCoFC3rNf4LDWJyxHuXJiWki/wvg3qaz5fo/C+n9UAuzfNZwJyrTNFpZ
         RJACiHy0vXgW/HSV9Q+yCq+Cuvdh4jvUwM9tYn8gbfBt8411amg63FaT3Y0fEJQ5w3oL
         Zj3Q==
X-Forwarded-Encrypted: i=1; AKwUvBx97pQ4Nw5tOPk23JDk6NSmW/TmtSG+oNjiMrcLTxKVaA/GQS2k/IMXyq1QLInGQYxbEY1IJ30V2BfIGzs8@lists.infradead.org
X-Gm-Message-State: APuU4Z/8EE1I6t7xMa5G4rtVEtDGd2vEpAglQ5d0eBQIEzDZY6uptgfS
	If6F9kYgyBI7qI3A9fpJQmPSRVulHq+A+XstaVGvzW3b+DWDdr3Jv3Awod9kfCJ08uA=
X-Gm-Gg: AYBFou01XVaMsEoud7Xf8pOgFYihyHWHcpP4ivou3WwM5QnvdFtKdi0P/WFwib8J6w1
	I/8HGzVNPMUCHfwvNi10wnDwS7QE+9UzV8cnb9B88RTHvIpHfWqByntWHT85z0SQNhsfKE5GECg
	xAG06c+YWayagNFwzQSLyuI+ltLDAfnDOmfX5fnVZ39RLVFoQvmU10jLYM9bm6Lq209pCwOpgwM
	MH+W3/do8ryJB0EqA1cMp8CQMzTj6H7faFX4VzSlZcAxq570cQynu0qLt85TYh1wvEAjDMlGGUo
	82394/QnXPMeYi+Ey1Hvp3hENt0I+nLusUm8Vv0wDpBoEsgsENzKGRmA533Q6B5IXgSMVw65kxO
	ltVAxO0Q3MHy5abSikD4oPOIsrT0ZlPBMNKwjjM4hVIY1pKgteHKqXPTTXSCYdjcy8H5kT/dH1P
	TWqVokZanBM0jYTiIMO1EzekB7DOoldr6KSRFqpKf7xLDQFyRvYmfDids2YHRnbOCjls+Ct4l9X
	hny8S23Vqv8PakXWkexipvac9LsdSLDfHnWQoTlFIk99SKBDly0rBOExF9VmBB2OwYsllK1b4Gf
	Mxj0Xy0Lx1F4y1w9WYae70bdzPDoULrbbTKEHJ10evCUbS/GM/GRH+gYrk3fBLa+pnbSVi4SzEQ
	ebEJiD76tBcsOmB3letETJqL1yu24TFpnZwjdkzA5ybNcW+g8DBsFgeh9
X-Received: by 2002:a05:6808:e389:b0:564:4dce:607f with SMTP id 5614622812f47-5644dce6571mr3450882b6e.39.1793723953457;
        Tue, 03 Nov 2026 08:39:13 -0800 (PST)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com. [209.85.167.169])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe42454sm11742996b6e.17.2026.11.03.08.39.12
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:39:13 -0800 (PST)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-55650fe1f0dso2145715b6e.2
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 08:39:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxOGwXgPhYNhm6Wj7dZf6Egvb5ZrSjvbEtKaYnJfSMcPORdnXy/IXjEp/ViGYGk7oi15fPFqAMNy3NAFtXh@lists.infradead.org
X-Received: by 2002:a05:690c:e3e1:b0:8b1:3606:65f6 with SMTP id
 00721157ae682-8b2b674a182mr76399327b3.64.1793723531633; Tue, 03 Nov 2026
 08:32:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-5-tanure@linux.com>
 <CAFBinCCtfPCsqN5yG7LWDFG=tyJ+aHix6x3yiXfaTAPP_A-hAA@mail.gmail.com>
In-Reply-To: <CAFBinCCtfPCsqN5yG7LWDFG=tyJ+aHix6x3yiXfaTAPP_A-hAA@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:31:58 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+2D8wKuMEgKWdJn4NA0wwuK5e1TuUtbhZbRZmFbVXmdUw@mail.gmail.com>
X-Gm-Features: AclHuK_uB_FU_COonRuR52ADQLZgO7wR8X01b0NCoWbrjac2-TTSlybmTTN1Brw
Message-ID: <CAJX_Q+2D8wKuMEgKWdJn4NA0wwuK5e1TuUtbhZbRZmFbVXmdUw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083914_547784_AA9D2CC2 
X-CRM114-Status: GOOD (  12.37  )
X-Spam-Score: -0.8 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBOb3YgMSwgMjAyNiBhdCAxMDo1OOKAr1BNIE1hcnRpbiBCbHVtZW5zdGluZ2wKPG1h
cnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBPY3Qg
MjIsIDIwMjYgYXQgMTA6MDbigK9QTSBMdWNhcyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+IHdy
b3RlOgo+IFsuLi5dCj4gPiArICAgICAgIGlmICghZHdtYWMtPmRhdGEtPmluaXRfZGVsYXlzKQo+
ID4gKyAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGR3bWFjLT5kZXYsIC1FSU5W
QUwsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIm1pc3NpbmcgaW5p
dF9kZWxheXMgY2FsbGJhY2tcbiIpOwo+IEknZCByYXRoZXIgbGV0IHRoaXMgY3Jhc2ggaGFyZCB0
byBtYWtlIGl0IG9idmlvdXMgdG8gc29tZW9uZSBhZGRpbmcgYQo+IG5ldyBTb0MgdGhhdCB0aGV5
IGZvcmdvdCBzb21ldGhpbmcuCgpPSywgdGhlIE5VTEwgY2hlY2sgaXMgZ29uZSBpbiB2NS4KCj4g
T3RoZXIgdGhhbiB0aGF0IHRoaXMgbG9va3MgZ29vZC4KPiBJdCB3b3VsZCBiZSBncmVhdCBpZiB0
aGUgbmV0ZGV2IG1haW50YWluZXJzIGNvdWxkIGNvbW1lbnQgb24gd2hldGhlcgo+IHRoaXMgbm93
IG1hdGNoZXMgdGhlIGFwcHJvYWNoIHRoZXkgaGFkIGluIG1pbmQuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
