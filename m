Return-Path: <SRS0=6jDt=EX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92651C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 22:55:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0943C22202
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 22:55:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gsy/f2j2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="KZY7kjNm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0943C22202
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T5GmcW0h/jDlxwZvqOvfebAaVDJFUBajAgNptye3wws=; b=Gsy/f2j2ETgvRPIexKJ8nwwb8
	pb1RMg7c3nNfqzn6hYGqQWWT8F2DerwCAmmwVEWn/siYVStraB9vLed0v4fkjuZAar3zHB1NBuFnq
	lhBuFXOtu5ljaK+dH1KyhWfyQRlkgzP3eeeT7jBwBBF0E8d06RrVvfRlUKmctu9vlGVXokAb9ApqL
	4ukJWXZMhWJATNfBGYxjDlPJ7G29boUqLAddLkaF70bHMUX9ds7lXXNAOgJ07RMgVy/j34E0eHpwi
	7U54kW1yYFA2XbX9/zXDy/ZaJhxnakyAwsYCFCaUWLmOsdsb/5P6+B7pEwUFY4ibx2taj6RT5WL1Q
	t4hl1pxEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf9t1-0006Bp-J9; Tue, 17 Nov 2020 22:55:43 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf9sx-0006Ao-6L; Tue, 17 Nov 2020 22:55:39 +0000
Received: by mail-ej1-x641.google.com with SMTP id s25so31758103ejy.6;
 Tue, 17 Nov 2020 14:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qEpMsX7umrh9W1uoj4wOxIl7k65AMD4+895y5wqaPqQ=;
 b=KZY7kjNmYGv4a0Uipuqg5wXyUqIQvGZYBkO5n34n9uNgWczhClk8jRt0v8EfYTdbfz
 zpuaA69UXFIxk58q4VOKQTpN6dlzqtiYWPpHQ8QWRZ7R+X/MEtnc9Z/Bxx3rDS3JsOdF
 6BZi773NNYPLSTnnQYSgeIp93X4FQfZS6kZdQrk1cDYPMXoAhOxba1zVeQG74hZ8SpR/
 u2ssh18JioOyWC6ItFwTUVXoLANoNeHfJHKO3DSulKre7HDpYYpU06VWgybLDmQ+wFvo
 nBNABrOAYeTFCZq7kIzCgB+WATeKAD0ESkOWL42kTq9DDrORR6g3pGkGTR6c5EmHqK46
 jrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qEpMsX7umrh9W1uoj4wOxIl7k65AMD4+895y5wqaPqQ=;
 b=dujEs4LTJRyIJBWkIPajVlJfOCQ+4mJ0cvEuTXnqRiLR6kW2jRwk64r/8gjoJ7THvf
 klhkEzEKLRcXSYsE8gQtrUG2qbvXEY1usViDnhRdmQqkt5ce/j3DfYbzjiP2tneK8azX
 n7IwdhyMgsRP8vzkwi6p8qGmThhXmnmfrm9avFIog1v0al9ONU2/obfQgQ1mIiQtB/yE
 YzImqu43CtPA9af/fjEXrXSmXVCyqqUwovSegMJIFsQYYVtAoffqTxX/8s1AykvGRGMd
 +9eCbQyH1gzChb+sItbO2tBDgttVdsjVitdD79AfmtG5IfVk2biGNMUNfVV4M7RYl6u4
 GQ/A==
X-Gm-Message-State: AOAM531ioMUGBIYg7zs1g2kOnrF+G/1W9jOMSgUsUvYn0Z5J83Ir8iPP
 jJWbPeAVDcGr90fu4veTCp6OcGGPfMC0bPWIscA=
X-Google-Smtp-Source: ABdhPJxbijK6/juoUqP/6V1GLG3p23sEWaIracp25d6S9D3+wLH6rLRBCosXcMAiY74K1MjHk1++m3w5bCpmNLMLoSs=
X-Received: by 2002:a17:906:76d3:: with SMTP id
 q19mr20994562ejn.162.1605653737992; 
 Tue, 17 Nov 2020 14:55:37 -0800 (PST)
MIME-Version: 1.0
References: <20201115185210.573739-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20201115185210.573739-1-martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 17 Nov 2020 23:55:27 +0100
Message-ID: <CAFBinCAXLqxqK=oB2eVDV+WY5up0dRYZ9=46riQ3uOWnw9jmng@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/5] dwmac-meson8b: picosecond precision RX delay
 support
To: khilman@baylibre.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_175539_351814_4DD719DA 
X-CRM114-Status: GOOD (  10.20  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: andrew@lunn.ch, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 Neil Armstrong <narmstrong@baylibre.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, kuba@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

On Sun, Nov 15, 2020 at 7:52 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
[...]
> I have tested this on an X96 Air 4GB board (not upstream yet).
[...]
> Also I have tested this on a X96 Max board without any .dts changes

can you please add this series to your testing branch?
I am interested in feedback from Kernel CI for all the boards which
are there as well as any other testing bots


Thank you!
Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
