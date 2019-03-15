Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD224C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:42:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8312218D0
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:42:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hR+mtSqh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="NbxOdJhq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8312218D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=acD/XIlMbmRSR8bRpYVAu+C2c1TMah0l90nSCENSNcU=; b=hR+mtSqhrtSpTF
	uEis3AN2uMDOofQLRacidZ2e8uVv/N8yLIIKykNrSvzM2FVq2Fdjw8B3Ixjl2BI+X3+SCKs7hWpP5
	eFv4tNPb3yhxixrq9sHNDjuHwn1p4AnLZekA2+V+m0ckyc4WllFHDSUn/ql7wZ/0jzjLyKNSwmdA9
	qVGMKjrDEpz53gMxf03uRebTtOZ8aWiI1GV5xmiOEZOXmgMPVFEKA7lyWTTQb0Hs+x9lbNi8IKtu4
	mstpyqu5TDFxsUB1C0FM61z18zC7vzi2FQOKoD6hHfC2cVZAU+9iH8DIQHgV7FWHAVYvQrHrRQbRW
	MFcQknYwKCg5XD76gS3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4ub6-0007C0-2d; Fri, 15 Mar 2019 21:42:36 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4ub3-0007BD-Sn; Fri, 15 Mar 2019 21:42:35 +0000
Received: by mail-oi1-x241.google.com with SMTP id m4so8533270oim.9;
 Fri, 15 Mar 2019 14:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wCtk3aXt0Yk6toX/gAFR9+fxygQzQO4SiBLOx7sFfow=;
 b=NbxOdJhq9SeSW35J3K5euk7k4btHshv4RGa4iDBMFWEdlD3uPj9hlHv3n7SsxBD5Yl
 phlsAbb6LW/U8tCX0VrgcTLaJbCbZKXKpHLEQJnU1z+0Ea1CJZR0MnyVSzSt4JcF+Zu6
 Rr/J3fb3P2KmxsObU61K4pCwUEPpRb6UfdGayMPTqEHjOWS2A4liIjCvgQ2I/qrJkdKu
 2b5qhmfapYqhA0iKFmA0qG0qYwdaAAuON1Q1GLoowBpy0FMF90SOjk2IoV/kH7B5Ssxy
 i5m4L9lWEmapHDr9bgc5AyvHE7+j+oHnMkjl+THCLVDj37BijQJKSRAcA5pmFAkf9umk
 WT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wCtk3aXt0Yk6toX/gAFR9+fxygQzQO4SiBLOx7sFfow=;
 b=KwIRWndIscF8VBTw03wSaFOr+l0S+wbQ+BUkm/i9OdWfg9BDm97Zddnj+ZALUYVqj6
 7ubwfFr2C0tsO2BHVq2tzAEKE2T3vXkUzXys/b71O8k4jztsgtLihvVQG5PcITzwlz3D
 /nmqMh+CmOftQGSjy1Ug6UUGalBjjfgpoNtDgGta/5kbgsBcYdIg9QRcTAvZLlyHiKQj
 LjLRVmQWS1qBURHcwtv5mf91+NhMPw8IJYMW9vltBQxk7uh7UbofrN3u3K1w7CFVav0/
 aRbNhYHWh0t65WtH09RvK8iJ1Cu5xf2bvBnF27wdXhegBZ6QVnW6+VnnR9oa0FuO0mW2
 RfLw==
X-Gm-Message-State: APjAAAVmsO51Zd1uxIYJ708VOZmToKK7+D/J/FyBnQ+KvN1Gjis53vTw
 YuWbH0Tfwz+P+ZTREzZ4W/NAJ8efJ83UP1RcQfU=
X-Google-Smtp-Source: APXvYqzxwy8S8cPwa0trdQVoNcSJAZk4CWjMLbj0E0bgebNh6uzLV+EbtUpD29j3sTl6tSweF7SuZXbAlJl6ZJCXz7g=
X-Received: by 2002:aca:cf07:: with SMTP id f7mr2937582oig.39.1552686152583;
 Fri, 15 Mar 2019 14:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190311095613.11371-1-narmstrong@baylibre.com>
 <20190311095613.11371-2-narmstrong@baylibre.com>
In-Reply-To: <20190311095613.11371-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 15 Mar 2019 22:42:21 +0100
Message-ID: <CAFBinCC4ZsPxwMHC7Tcysp8hkg_aDoPLUGdS7J81tLzndksRzw@mail.gmail.com>
Subject: Re: [PATCH 01/11] arm64: dts: meson-g12a-u200: add uart_AO pinctrl
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_144233_932821_BF5FC770 
X-CRM114-Status: UNSURE (   6.26  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 11, 2019 at 10:56 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add pinctrl on the always-enabled debug UART AO.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
