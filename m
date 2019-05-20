Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4045C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:39:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADC1F206B6
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:39:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YVt9ImAH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Emn9AT32"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADC1F206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZWzKFMETJv01fDo0euUCOVjBqvTFX+DBirIPmH3QiE=; b=YVt9ImAHXbvwai
	NmvAaf2mgbBXXYwOB6MkqdJ3KdiSeO/HUJ+oJM23R0wTOzLu8x3NcIkKUTJYXwduvPRx4o89znf0c
	qJN+ZyFrU87MUwFoLBI49sp978J5CwgfBeHSWCEk0DR/Ttj5SoLdhZMMOUQYM8TkYc1NfxewR8PHu
	LMEhrAyLIhjq/EkOsHqUQ4WebFbDIdR2seIQWMe+TFjAR9d4Dxn3svYa5mnK/BVa4K8ggUFkO+9B+
	1M5iDafdS4iVPzis9EPwjKHV3z0hOLIRGjNO5tKWwKuY/HWz1x166ZrDoo3VJkqR++bvFFmOjAoHL
	zy0U4W7vu4QUV4g5j5Gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmFX-0008H2-Jq; Mon, 20 May 2019 17:38:59 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmFU-0008Gg-5b
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 17:38:57 +0000
Received: by mail-ot1-x342.google.com with SMTP id s19so13772975otq.5
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 10:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b6+CTVKBQs3Qj1KZuVZhRpvI2ElGfiLdvO9SBHsRRR4=;
 b=Emn9AT328NF3cmC1iuXJyjI8jhIp44Nr/nGjaQMHzXGLQcs0C4w6xX8XhMyD9tex9I
 PKmw0Ew3y6qIX/Kzs1pYJf5uhYmA39g3WMr31pBc72PX/YdWDEGUwysxyWFzIklVGtl5
 RKHCHFuT0DaY4mwTZry6Gn5A+orMbXaNTSzVxz5euJhu9NFvuPWLHdh+wlotMqARc4sK
 ZhOGLwQ/deEbN6rkGellDZMXxbSEVme4RbKb/JvzEgvDhQibsDwuxrcwkPUBHeoWBXjJ
 bD3KWbZdiRGrBk2qPIi0ff02XN8hEG0Ak499Kxue0UX7XyzsnwChk9Hz31MCY2F3Smdi
 sW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b6+CTVKBQs3Qj1KZuVZhRpvI2ElGfiLdvO9SBHsRRR4=;
 b=OkmEhygdA10LqLqEb0ZJLrewjawCtmVwULJg5Pt5X3uglZOyJCAiAioDQ/yGKXFpl4
 ebqkpgSdVii5FqMuzLcPXJOAv8YCXCJv+ZWpTnltcOMRaki+CIxbOZU0e3VqbdgGYq/E
 NNJgdxQUR1tuE3nXu1K8WY8rgxBTbIut77IvAbcRdCZ9xmTYXe3p7EzhW6yDMcJQhpdT
 4RoH9I5JqQEvje/oiks1fDrTzzyhJtpk9dDSD+9icuPI/tO9vpfKh9dPfIsJU+0sF33h
 3P8drq5oN/GeFZXn/1a6ao/bom11BuducQEgsVCGsFhg3eJBqLX5v34i7dnBIFCiqwe0
 tHlQ==
X-Gm-Message-State: APjAAAVT9pdrbv4gH0RZL1qNpieZBRCTutyp6L98X3orH1RZbnEFdjPa
 duIbZeOclPidfHykWIIySmc1xx29zMus+D27lvUwaopiDm4=
X-Google-Smtp-Source: APXvYqw7JjFH8JiPg4NhlniBsb8s7dSni3Mu/yHYGMyoIAluZi0RPsU9K4l+vLYJWVRWaMSaLhvc5u6eu4whddsx070=
X-Received: by 2002:a9d:69c8:: with SMTP id v8mr46402547oto.6.1558373935100;
 Mon, 20 May 2019 10:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190520131401.11804-1-jbrunet@baylibre.com>
 <20190520131401.11804-6-jbrunet@baylibre.com>
In-Reply-To: <20190520131401.11804-6-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 19:38:44 +0200
Message-ID: <CAFBinCBGEoWxvpNhy+uehEmP9c-0OW4DFR8_iGPZ7ggjdz5aWw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: meson: sei510: add network support
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_103856_207572_F5050FEC 
X-CRM114-Status: UNSURE (   7.37  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 3:14 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Enable the network interface of the SEI510 which use the internal PHY.
>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
I don't have this board but it looks sane so:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
