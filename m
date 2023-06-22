Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF8BEB64D8
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 08:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KExIJjzNzpp2aEXKBWPpy8UR1BfwW24gdnHkZ4JxdtA=; b=Et5LV4vVyqcAvO
	o8N6px+ZG/1JKz9Kg2UJz4Sgtu7xaWwWJpFHL3YI0c0phPNrTpHNSobKLrhzHZrLkP8uOBpGGyBNa
	7QK6mu0d3ZmPrJjt1EMp4/OBMCKQzlmn3t+a88hlj5Vj555jldw1WOMpLFOTziXd5N23nrIYe4UXp
	OW0stx5QIXnRv9Lqw0jStgCkty0aiKi4c5v2wYtGEkVgZoQc3cKkyAyrTTy+Rf8JXHaUsYUjg8gdE
	a3hiPK6DciP0Mn95dI/oNCLaWAYGhx6/TfDyc13h0TSHTEjty4psdnqn095XE+tijlLW7Dj5kcXVN
	r7UXlG/oxng5iuOLDEgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFP9-00HNKq-1G;
	Thu, 22 Jun 2023 08:10:59 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFP6-00HNJ7-24
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Jun 2023 08:10:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fa71db41b6so4136795e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Jun 2023 01:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687421454; x=1690013454;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E6E/DKjP8bIO9nlNl0dJE1KVK22hxgPcNnONiA41pro=;
        b=gznygwPGC1pXzExG36qSookApcXSWC8V8JkfWObvXUwxiWWqt83zwo63bOaBkQmMEq
         UkL85J0FDWpWJE4VaZxBS+LqP/fEqSjnbMw34MpcF/hJlNUJnPkR7auMLJygD4y8QUw+
         Ekj8PUSzan5R5f21XVWtQIIFB7GTtILqZAUEDkmpOhaeo26MAxhPgrzIYXFCpZSwKivF
         xjbPbdAZgC9hoTAtFrTpxc3hBWditVZwxtRpnaKzkpfuTaOfSSZa2BEhu1CB7K/S4yuR
         jkEdLfNO2iXMwYkJ7eQsUVjTRyoUql9+o+L/cLD7pPXS3rmz/InjXEHAUjEbZuupWx+3
         nqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687421454; x=1690013454;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6E/DKjP8bIO9nlNl0dJE1KVK22hxgPcNnONiA41pro=;
        b=VurFaGqHpaLC4eEsfHykQ21HX7T6T6ikBq/eRMyRQTBMxjspI2Omb885nemIYi1iFR
         ptbtDk21BpnDHwFtBh8vePlj3cSzvNnGb2SVxphRsTCaZaoWJTlUcmMvPhPA6SU8wAXL
         li6Nvg52ah1L6aHIs/eLaPnlLghc9uAw5BlZgw8R0E+nL9lzJv3qvWI+CI4YAt/RaOLS
         RXW7Yy73EHI0ITOVoD9CzLLwcejn4ELP3EO8W5pVLlObD5udyTpBFN+si+mivZ/itNMY
         nNdMzCI7FRc/Atld6Beb0lC0pVwrDCsYioQ+q72t/z+KmsbS+moZvWV+yD1Cb9AJ5h+8
         ouqg==
X-Gm-Message-State: AC+VfDzLYRdN5CV00De9o+HhgTrcyZpg0LW4BO4hPlIrjkMq+dGARJWZ
	8mXdvbVoCHD0TPwwfHBpHHYLZw==
X-Google-Smtp-Source: ACHHUZ55OPiQl2bI3ECC95oo1SQkENMW+Ehw8FL52KPlnvb0Op00znXJhgk2lQtMgl1Nu26ZRi18cg==
X-Received: by 2002:a05:600c:214d:b0:3f9:ad7:ae86 with SMTP id v13-20020a05600c214d00b003f90ad7ae86mr9011643wml.37.1687421453816;
        Thu, 22 Jun 2023 01:10:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f692:a800:4794:385? ([2a01:e0a:982:cbb0:f692:a800:4794:385])
        by smtp.gmail.com with ESMTPSA id z11-20020a7bc7cb000000b003f5ffba9ae1sm7023861wmk.24.2023.06.22.01.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 01:10:53 -0700 (PDT)
Message-ID: <a10ea420-7599-3f41-dfd8-1742ef436ca0@linaro.org>
Date: Thu, 22 Jun 2023 10:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic late Drivers updates for v6.5
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_011056_697536_92A4AC32 
X-CRM114-Status: UNSURE (   9.36  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's a late Amlogic Drivers changeset for v6.5, with includes
a low priority fix for secure-pwrc, a MAINTAINERS fix and a bindings yaml
conversion patch that were lying on the lists for too long.

Neil

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git amlogic-drivers-for-v6.5

for you to fetch changes up to 6b0139b372d40bd5dafc140b6618b57d13211168:

   dt-bindings: interrupt-controller: Convert Amlogic Meson GPIO interrupt controller binding (2023-06-20 09:41:07 +0200)

----------------------------------------------------------------
Amlogic Drivers changes for v6.5:
- tag some powers domains as always-on for secure-pwrc
- fix MAINTAINERS entry for PHY drivers & bindings
- Amlogic Meson GPIO interrupt controller binding to yaml conversion

----------------------------------------------------------------
Alexey Romanov (1):
       drivers: meson: secure-pwrc: always enable DMA domain

Heiner Kallweit (2):
       MAINTAINERS: add PHY-related files to Amlogic SoC file list
       dt-bindings: interrupt-controller: Convert Amlogic Meson GPIO interrupt controller binding

  .../amlogic,meson-gpio-intc.txt                    | 38 ------------
  .../amlogic,meson-gpio-intc.yaml                   | 72 ++++++++++++++++++++++
  MAINTAINERS                                        |  2 +
  drivers/soc/amlogic/meson-secure-pwrc.c            |  2 +-
  4 files changed, 75 insertions(+), 39 deletions(-)
  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
