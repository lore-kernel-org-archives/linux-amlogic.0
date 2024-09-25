Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3C8CCF9E7
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2024 17:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MonTazH4n/bWQh6OichXo2DQGmDNjK890Q0FWMT/898=; b=bOO+7xj9UH2ze/
	SJTCkZ5JfsH+/RKYcjw4I87tBoV364G+iArZT8vG8vWZC9duXisUfIEguz+vX8ULWHwZz0hD1pEZZ
	WYNvJisF2QJtDoMpiaz6HrDi4Ea8ZZPtrmIBQ3j6+aCchNis0mqNnf8SX924XiY2yMaChfhCVceeO
	4DFO2I6KbBPMudGzVq5cIzGDpMkiRIka1kWJQx0DYMwsu1OEl1zeBTo2J2kPb2gjaR/fyjmq8zAZj
	JQD2O+hzFLamE4oet8ObVR3Jt2Djmu97YIFoNvVyIldABVtbutbtriFvjkbvURkuXa/jmtpBFwSR7
	aGD0vGrbw6gKMchCdkkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stW2c-00000006DyU-2Xcy;
	Wed, 25 Sep 2024 17:43:06 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stVzZ-00000006DHP-2RFB;
	Wed, 25 Sep 2024 17:39:59 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20b0b2528d8so455675ad.2;
        Wed, 25 Sep 2024 10:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727285997; x=1727890797; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ht2EcEikcbIMJuaEwdOngsMiZXk7fRHIUcBV9+yWZRY=;
        b=JVtfGfxlYXcn4xlYtYllLPUx+7rsuoF2uMC6F1+PkQEImkoYqk2JuweMRXvkbJiSdT
         WWE2F4Jq29wSBqo0EHbNjew/a9vr7pitH3H69Oqgkoow+BqMd43UtR8CFH96qNPzQSPh
         xBFIO5XjajPU+6CNvjGWpAhRHN7uiS+0SFpqP0gfGszs8kbpsRUvUKRHHY5RiVaeNqF7
         hffNmelxhSyVKTWHgsOyvFCpkgYEqGYFvD7oIZnieHC7Z1oTbdqbWpwBBaTMqPysvM0K
         1dwQikUGaia9/JE0rgTQgFOYnd2T0PG4cuQ5XaxyKKks7+bv8UzZ32LdOX+7ZgQb21WH
         Bhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727285997; x=1727890797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ht2EcEikcbIMJuaEwdOngsMiZXk7fRHIUcBV9+yWZRY=;
        b=dDwTxqXbXWzw6yIU2sGmVbh7CXt2Vesww457EWS+ICE0N61ADgKGYTEHQU9+qVHDOW
         o85xnXl4pYaHVyJqYI6u6IDq3PFTajIdFQ0ypqgtnhteSgLefG8BCXCYC+I/oZkd0JFJ
         m+psWh3GGFEiOJjCQuHntCGR+3+7IxijLKIr2psijQxXusGRabwnZ77lSqKft8l8z1ik
         9d1KvW8iViBqon53EgqXM3caMWxcVU3evyQGYzacW1nqRb94VzrZEupPCxFQK4/j9xcD
         fMlm7hySvF+3f2my0J1MFPZ29aCAQSfHA7lG0d7X80afA3+uYHTtZCYbd2r48t5C57R/
         eMKw==
X-Forwarded-Encrypted: i=1; AJvYcCUIUXJRephazpK4MLq6uQKOWS/4i45lMeiJBSpGvEnE7omEJDLx2ZGdngtOYSRLfk6koEM0UpyTvYHEng/o@lists.infradead.org, AJvYcCWq6BwTF4H0PCMPMB1UXcamZ7/A5kjsqAcuv0FDf8HDyiqHP7MOsQXcWI0NyYUfwca3lZ8/9CClFuFAW/QbLk9s1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfkbtEXA9J9tvyqhauFBnNcaPLviSXi9sSIhfwLmqm6VgL0uN3
	DwZb9wYxSzPLXI1iFBaFxdcGlt908O8dXPWb7MfCeyRxsaTy58vL4JHyXkGfnJM0sZBJA65L+qi
	XLyryc2Y/3zq1yofdTCUlbjhvQDc=
X-Google-Smtp-Source: AGHT+IEh/Hcmf4a9J5+Nv/qry1eE5XkIyECg8/8feJZSd1MXroHW0wCb4gcU5w5yYvWtw92GkfOB27kZBc3v20BuGcQ=
X-Received: by 2002:a17:903:3390:b0:206:d6ac:85e1 with SMTP id
 d9443c01a7336-20afc401bb4mr35681795ad.2.1727285997005; Wed, 25 Sep 2024
 10:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
 <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-9-0b20ed4f0571@linaro.org>
In-Reply-To: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-9-0b20ed4f0571@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 25 Sep 2024 19:39:46 +0200
Message-ID: <CAFBinCCDwGLGtd1i+Umtt154s6Vm0tRDJ02TV4MpawwCGnoXrg@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] ARM: dts: amlogic: meson8-minix-neo-x8: fix
 invalid pnictrl-names
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_103957_646737_92C26346 
X-CRM114-Status: UNSURE (   7.85  )
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

T24gTW9uLCBTZXAgMTYsIDIwMjQgYXQgMTA6MDjigK9BTSBOZWlsIEFybXN0cm9uZwo8bmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBUaGUgcHJvcGVydHkgcG5pY3RybC1uYW1l
cyBpcyB3cm9uZywgcmVuYW1lIGl0IHRvIHBpbmN0cmwtbmFtZXMgYW5kIGZpeDoKPiBldGhlcm5l
dEBjOTQxMDAwMDogVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBhcmUgbm90IGFsbG93ZWQgKCdjbG9j
ay1uYW1lcycsICdjbG9ja3MnLCAnaW50ZXJydXB0LW5hbWVzJywgJ2ludGVycnVwdHMnLCAncG5p
Y3RybC1uYW1lcycsICdwb3dlci1kb21haW5zJyB3ZXJlIHVuZXhwZWN0ZWQpCj4gICAgICAgICBm
cm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL25ldC9hbWxvZ2lj
LG1lc29uLWR3bWFjLnlhbWwjCj4KPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVp
bC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wg
PG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
