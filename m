Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0365C36011
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Mar 2025 20:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3atruZw5vjvaDiXnoG/6QZQT0hTu4Fgq05Dioo9cHM=; b=yWDA+zgip0CMng
	lRVEo/sOQCGylB0PVpvLzmWzNQlHBqKnaSU9+bDRR7ZGX7MQ8fAbsA4laiWmcVc8G7UHPDP0wLHOo
	bCwWHadmhSs9MHDKX1y9Fl9/uMVhm8ORZcBLyjX9HevsWgUT9GcSnTBUbK0qhS1bGPgEn5F72yWgO
	gK6QfpVCLsqDr91kZdRFzhtjKRIBFud7Ki5aHLQFCoHLcT+0bc2QyJRJVhaM/d8P5F7CBTRDJPVzm
	/375OmuRc7g5rXMTB56gRIHuC5x4eIezprStHhzIsWNX15/iaVv7Qve8Qg0nn8ul6hT1yrUJZrZ2V
	okE8Q/vaQ8BjuIMCjTJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyzg6-0000000Gfuw-2mjt;
	Sun, 30 Mar 2025 20:54:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyzeL-0000000GfqR-0vdB;
	Sun, 30 Mar 2025 20:52:58 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22548a28d0cso105630205ad.3;
        Sun, 30 Mar 2025 13:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743367976; x=1743972776; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJwLIFJszXYQ7ADlOOhxydXwlK9mYBVF/IXABoKgtHQ=;
        b=NMje6EEz/AMVoTSY/AiUNhqGsHvZL07YC00GIfvk+wOPZwAf4OyDN4Gart4RJeH+Em
         dO478pkioNBtwLmpFsGKVR2qV7Q7lIcVGtmRQitjYXuf5ioJVJG/Q/TNZsByAWscDXb7
         h/7YKxDviBKaTeeMVGyYB6NdBI2tr/RjrZ/wby9GcHXIuZsrd/UyJqHLhQk0w7MFbvy1
         iktuKO8Ub7iepqSuDRLRwOen8NgEwRT/alvV0/9TZNdE2QO0KaFRsAcRDulAToWfYZbE
         FEHbaptJ8Iu7b+aq1/oSvO60rYl0rEgI/J86BWGvt14pLjRK11QD1ZGhymJBuMh68IOE
         NMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743367976; x=1743972776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJwLIFJszXYQ7ADlOOhxydXwlK9mYBVF/IXABoKgtHQ=;
        b=ah64rFta8Mr1RjCHQEE9u1MTiJG7G+K7gyUlSOV3fuLg3jfEcCKFHCyvQOUTvplcLl
         maosY++X3HYlw50x7r4/cttp4dcCkgRPehKgjoRqfxeES+1pC2akDYwK5C0nShA+sbTG
         UogzP4cPUdXvtO6Uy4K2DAvGkiF3R7B4CRTdOhpri5XZShvsGdshk0Tr7v9XgcUs+H9v
         x7+XDYoe4xJdNm/qLm07Csg4qL73WrTV9XGJTC0BeJRGNxpKyspg2OVp+N+6DD5EY8Vz
         eMWdJ8mWfKJWo/Nxm8onuuthdMPolfwZevZ1xAha+xLq9fuqAMQ9GOqWJN7LHtJQ4Z1O
         c64g==
X-Forwarded-Encrypted: i=1; AJvYcCVPdtfNEST+Bk5xCmhtc1nGksfqKcD38l9EDjWEB1c21pwkoiseldXjMZbclQq4cVo/ca7Y5YvyM3Rvib/A@lists.infradead.org, AJvYcCXh/gYGGq5JIk3FdLKAMYoQpQw9YWUcwtY+5UDEjC63t5+qG4mHU/y8w6dHxFQYzZfmdeJzJQpxB5iMJkYbzzvOxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeeKr8AfLyurNSCKE+pVfCEn3pkrZIo984CZtPAegVw5h2gUQM
	e6yFd+FiYYZNsG4bRxzJ4Ugj11nilKk69NxPbG0kjstY7i4S74GkedeVtgWn9hhazmwUjCYX28l
	uhzGy9y3GQZ/s9ecqe/uoi6c+5B8=
X-Gm-Gg: ASbGncveW5gc7JMT60tn0xb1HEa/VHIS2AOInqPjs6PKZW0p7NtagMFCOT/vvHaJaGC
	erDfK1GddVKG3Gt7xQqiW+4QImXo+PZMU+YB6ptynlVJk6u4+EFEqK6olxsRhlD4ssdS+13bsrS
	NoI/lczxkaBaCbgsOeUOo3iqaEupDM6IOLB2SNwj61aiMI8g1/63FslTo7hQQ=
X-Google-Smtp-Source: AGHT+IGlpG9xeO7YabfvvWdcL4rWdf0vZ+QCfsjk6aFSH+Qe92WIllUZklTnZqtfCCxYvcoObf2vFCcEInm2m2e86xU=
X-Received: by 2002:a17:903:2303:b0:223:5ace:eccf with SMTP id
 d9443c01a7336-22935084a88mr74482475ad.25.1743367975896; Sun, 30 Mar 2025
 13:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net> <20250323-fernsehfee-v1-2-2621341cd37a@posteo.net>
In-Reply-To: <20250323-fernsehfee-v1-2-2621341cd37a@posteo.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 30 Mar 2025 22:52:44 +0200
X-Gm-Features: AQ5f1JqiXYa2Fy3B0Ec_8DxGmkHROyPsojXcUZGTqJUnNHSoBI9B-XlVAsRTV_U
Message-ID: <CAFBinCAvCvqbv367_rn_Rbvn7p8q5kCLuSE7m+gnxaDo9FvaeQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: arm: amlogic: Add TCU Fernsehfee 3.0 board
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_135257_301681_EBDC1904 
X-CRM114-Status: UNSURE (   6.85  )
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

T24gU3VuLCBNYXIgMjMsIDIwMjUgYXQgMTozOOKAr1BNIEouIE5ldXNjaMOkZmVyIHZpYSBCNCBS
ZWxheQo8ZGV2bnVsbCtqLm5lLnBvc3Rlby5uZXRAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9t
OiAiSi4gTmV1c2Now6RmZXIiIDxqLm5lQHBvc3Rlby5uZXQ+Cj4KPiBGZXJuc2VoZmVlICgiVFYg
ZmFpcnkiKSAzLjAgaXMgYSBzZXQtdG9wIGJveCB3aXRoIEhETUkgaW5wdXQgYW5kIG91dHB1dAo+
IHBvcnRzLiBJdCBvcmlnaW5hbGx5IHJhbiBBbmRyb2lkIDQuNCBhbmQgYSBMaW51eCAzLjEwIGtl
cm5lbC4KPgo+ICAgaHR0cHM6Ly9mZXJuc2VoZmVlLmRlLyAgKEdlcm1hbikKPiAgIGh0dHBzOi8v
dGVsZWZhaXJ5LmNvbS8gIChFbmdsaXNoKQo+Cj4gU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6Rm
ZXIgPGoubmVAcG9zdGVvLm5ldD4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1h
cnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
