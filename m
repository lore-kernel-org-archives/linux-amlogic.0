Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDF3C004D4
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 04:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=spN2jkDYSyhJI66F1DXpJxO5hxDaGqfNzs9denAcP44=; b=f6lS4j9cvLyb96
	wGue7XgjL8O7W21tyed1BTePSQ2NpUZy6pWuIKyc7AyUoSqaNgc8C5bwyW5+gnh5VkaWdBPwagXS3
	Dd/s7TsalNwlLPNua8PxYU7OssZUk1ZYNLFEpEH0FdbYVCYq49L/MzE+zTfa6/TfJnV0q24dKV8Mg
	tu8A2yhGFDqV9am9HqwjFfa7ntx9yH3ftrKGD1whhX7zIh98PlvpcHgluJxwD1csSP8hfnzi6N1Kr
	0HadR/tF3IoohR4nM7kpoCRGQLFme94ANf8lB6Q99Agtjer5uMCyhQvw7KDewduFma9NRWFhGHC+N
	l+BQ4EqeJ/b7u3uvCutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI0JX-00Gssc-7u; Wed, 18 Jan 2023 04:44:43 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI0JU-00Gsrp-Vg
	for linux-amlogic@lists.infradead.org; Wed, 18 Jan 2023 04:44:42 +0000
Received: by mail-pf1-x42a.google.com with SMTP id z3so968245pfb.2
        for <linux-amlogic@lists.infradead.org>; Tue, 17 Jan 2023 20:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0lxoOUkcJ/KOLZdzC6xz5CbicZbR5gNovvjCwKsceY=;
        b=FlNH3KI/EFjf8IyzwPj+igW93Y54628YVdmx3JyIHJYM1z+hoiIughWE8487BLc0VY
         LaoGu1ukTP5MqqXtUNtGgyvgUjtDxOXaDOeAxDiEu4XI4Buyaa4dANpe8I0X4DDckE3x
         DX2YxL129EW71ig7VuDmKLBFAwqbg3zFqaf5bUEKk1d7noYuk9wJwcHbFeqaKopbpM8f
         n7HDnt9fZF01dx+G+QT6Dp6JMrpj0orQd15Hadu8rdodgyWbjrAyT2Wl5kGm+WlHFVei
         HL1qYXq8pNVCsGSvrAtF5zXu26BLNFmzTjleFxu7I3DktoMagyOht/6OTBRdeM1/MWet
         bfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0lxoOUkcJ/KOLZdzC6xz5CbicZbR5gNovvjCwKsceY=;
        b=IC+dEyVPA5HHXLJxL1n6Z+VwcBITHL8D4RcNf4liAZU4W3hckBD4HjS5MF4hV5OUEl
         iITcV+/b39MYLJZTXwe31ks/DG9Ll/b29/cQ7MXMqTFI3YpxBg6E4zvtgbHp4DEB1zvi
         6yS3LFOnDEuyrzh2FfNVSLBZr5C8ffrA16DYRM//a/wFiWBSOfjv8eVOK7SZI5OXsPHZ
         s6jkArXU2FYzwTZ1DVvGNFxMDfMhJ21oGk3jLAug3n/RqwvovsTJXxZZYf7V3cwpFhSg
         fz25UJIHqeP8SE6wCAOGacjnkOR4oU/TgS6Hz98f1W8zxGJ6qaQr6r6lIpJ22M5+QNBz
         +QHQ==
X-Gm-Message-State: AFqh2kqGRglGSiXnfJjlPA96/ygX0Fw+IjhcVgaIYCbEzPA+AM7YENMF
	4bw74Ff650N1xTScD3DwzwY=
X-Google-Smtp-Source: AMrXdXvOoNZdQWYRFluUn/i5J9UWfSkZ+dDlHuOWGVCAiPsCvv3B6oS9bmvepzllVx8YzzuiuTp0Ew==
X-Received: by 2002:a62:3684:0:b0:574:3cde:385a with SMTP id d126-20020a623684000000b005743cde385amr5917372pfa.32.1674017079488;
        Tue, 17 Jan 2023 20:44:39 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id i1-20020a056a00004100b00581a156b920sm8682770pfk.132.2023.01.17.20.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 20:44:39 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: linux-amlogic@lists.infradead.org,
	Matthias Kaehlcke <mka@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/9] dt-bindings: usb: Add device id for Genesys Logic hub controller
Date: Wed, 18 Jan 2023 04:44:09 +0000
Message-Id: <20230118044418.875-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118044418.875-1-linux.amoon@gmail.com>
References: <20230118044418.875-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_204441_035718_BEF1CC01 
X-CRM114-Status: GOOD (  10.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add usb hub device id for Genesys Logic, Inc. GL852G Hub USB 2.0
root hub.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2: - drop the vendor name from compatible string.
    - drop the -OTG and -QFN76 suffix from commit message.
    - drop the GL3523 USB 3.1 root hub device id.
---
 Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index a9f831448cca..cc4cf92b70d1 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - usb5e3,608
+      - usb5e3,610
 
   reg: true
 
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
