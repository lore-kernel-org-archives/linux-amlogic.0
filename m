Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28429C77B60
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Apr 2023 21:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8nAimSZ1tMZiCy/UbFvQqs8eu2ZqyNFrPCGOSuQhtc=; b=hy8RM+WTfNfhFe
	iALyyMhSQv1f/66Y369fIW/RfCW6JDbOoVkSgcNFq4goTyxbN9PLdEXDZK+q82V01Oi05LwUcILfs
	HbSDfSmzEdEA5mJEwPaB8eGAT0ZtVbVoZ3B9PdM7LkCVs+ACMwQoNx9Wetzi3KxoCsv8YRXsQUkGE
	azSIwy+1OYLBF5bzowrarLfVAKb+XUNuBkzTqAFk/r8udFNUOx2EKP74S+bncj9lSH9S8Tw94Kwi+
	DqOdix7d8IkPkSiK+KgTwmxpvDVz5dcvIOUtC4e+QL4MX4VBFhx3TExb/VRTdg2B7JANy38+9js+N
	lFU6oL64CF1APSffZRUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqhIM-00Em5W-1E;
	Sun, 23 Apr 2023 21:30:54 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqhIK-00Em53-0M;
	Sun, 23 Apr 2023 21:30:53 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-94f32588c13so511160366b.2;
        Sun, 23 Apr 2023 14:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682285450; x=1684877450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18byURsd69WE5YM1Kosl1na2iTLaVqec0Q8hqzElXCQ=;
        b=UpMUVMIcZYwgzlBgNfqGwLaGTQ8LBZpckrkTP8co4uaVRiioXyYKodDl4UM1opzsCR
         FwjKYa6zIDlqL8JlsMdEtfFfuuoil92uNwnlO7WErAKHAiWAuScXiPNCvXkhH8WC0C1Q
         LH102yESfPCFKqSlANYmth5TTctAP1PKpO9WJy+XEvumJlhs8cXlib5QpowvbWRO6Fm7
         oNsE6IEyqwK12t8ssFWtQnIM7xJ8iXyKNKch4H02mKofeI/sH1lXFvUb9D9/l2qlg9+Z
         Gtm3lNCy0k6ArmuDxI2ngSJVv12OSM617rUDxAdvwGjcjhGZWLvREkrw+Aobp5sdLsX8
         zWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682285450; x=1684877450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18byURsd69WE5YM1Kosl1na2iTLaVqec0Q8hqzElXCQ=;
        b=NBnR5j/3Z7YJl/qS+DLZy5yXRDuMdZibxARCCQzZwDYMSlJz9kQKPax+o5MDPWyVdx
         uNwhVKaJ10TpVOeza7uptkrwyUeU+7p61E0PD9Egr2ZB6UOeBjTSJhAJ0IOVbPQBFTn+
         07EpBwjnPRT0R27C7QwY/q/jxm7wtYMCn5BuCHKsO7kLIBOn79BcEFlw9dNSoQ5TFxct
         ycY5M0kNSb+1HmJpYr1+PgHCWz0QSZ/CBh2gXQ17/pU43t+8QqyPKfP9LDKLF8r8NR+Q
         hYVk3yGObi1yCYrEJUG6GFM1PgnnNEEhncb8D8ww/gkqm9Mr1CgkWmZ7qIq821g6Pjij
         0eyQ==
X-Gm-Message-State: AAQBX9fwl973RBCqcQowKUtojXWOGm2eacZzQMLmmrmWMyPsGe62hllQ
	Z+s6QOq23i+P+QohyCblyMBgMPLaF2w9/WURklM=
X-Google-Smtp-Source: AKy350biznEeVdPR+IKziz5Mo9fGNq2BckRGQcSOldDmB9sxfrWldGkWu2J4s9qdYYEN8VS1dRs5YAeA8QzTRjhqeh4=
X-Received: by 2002:a17:906:7d6:b0:957:2d2a:e8a2 with SMTP id
 m22-20020a17090607d600b009572d2ae8a2mr7535957ejc.27.1682285449823; Sun, 23
 Apr 2023 14:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230405195927.13487-1-ddrokosov@sberdevices.ru> <20230405195927.13487-7-ddrokosov@sberdevices.ru>
In-Reply-To: <20230405195927.13487-7-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 23 Apr 2023 23:30:38 +0200
Message-ID: <CAFBinCBGWOB2XLb6su=R3W684rKdK3pOgPFsCGx+Oyo_pgdeBg@mail.gmail.com>
Subject: Re: [PATCH v13 6/6] clk: meson: a1: add Amlogic A1 Peripherals clock
 controller driver
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, jian.hu@amlogic.com, kernel@sberdevices.ru, 
	rockosov@gmail.com, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_143052_144482_6DE18468 
X-CRM114-Status: UNSURE (   9.30  )
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

T24gV2VkLCBBcHIgNSwgMjAyMyBhdCA5OjU54oCvUE0gRG1pdHJ5IFJva29zb3YgPGRkcm9rb3Nv
dkBzYmVyZGV2aWNlcy5ydT4gd3JvdGU6ClsuLi5dCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIGExX3BlcmlwaHNfY2xrY19tYXRjaF90YWJsZVtdID0gewo+ICsgICAgICAgeyAu
Y29tcGF0aWJsZSA9ICJhbWxvZ2ljLGExLWNsa2MiLCB9LAo+ICsgICAgICAge30sCm5pdC1waWNr
OiBwbGVhc2UgcmVtb3ZlIHRoZSBjb21tYSBhZnRlciB0aGUgc2VudGluZWwKCj4gK01PRFVMRV9E
RVZJQ0VfVEFCTEUob2YsIGExX3BlcmlwaHNfY2xrY19tYXRjaF90YWJsZSk7Cj4gKwo+ICtzdGF0
aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBhMV9wZXJpcGhzX2Nsa2NfZHJpdmVyID0gewo+ICsg
ICAgICAgLnByb2JlID0gbWVzb25fYTFfcGVyaXBoc19wcm9iZSwKPiArICAgICAgIC5kcml2ZXIg
PSB7Cj4gKyAgICAgICAgICAgICAgIC5uYW1lID0gImExLWNsa2MiLAo+ICsgICAgICAgICAgICAg
ICAub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIoYTFfcGVyaXBoc19jbGtjX21hdGNoX3Rh
YmxlKSwKSSB3b25kZXIgaWYgd2Ugc2hvdWxkIGRyb3Agb2ZfbWF0Y2hfcHRyKCkgaGVyZSBhcyBu
byBvdGhlciBtZXNvbiBjbG9jawpkcml2ZXIgdXNlcyBpdC4KQWxzbyB0aGVyZSdzIGNvbW1pdHMg
bGlrZSAwMGNiNzU0YWM2MjIgKCJjbGs6IGlteDhtcTogZHJvcApvZl9tYXRjaF9wdHIgZnJvbSBv
Zl9kZXZpY2VfaWQgdGFibGUiKSB3aGljaCBleHBsaWNpdGx5IHJlbW92ZSBpdCBmcm9tCm90aGVy
IGRyaXZlcnMuCgpBcGFydCBmb3JtIHRoZXNlIHR3byB0aGlzIHBhdGNoIGxvb2tzIGdyZWF0IHRv
IG1lLgoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
