Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953E2C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:58:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71095206B6
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:58:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PEH1lOt0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Jm+dRAmJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71095206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6HzXzmSmHhcq9O9uMaCgGS+eYKCdqMzruSsFd3WnNg=; b=PEH1lOt04DbSOR
	jXigvycO7xscZF/vu0unZdKuax1QPTu1p4jNLgo+kFxoKJiBm0MOWAX/u0dpBFOLM2M1ZNgtKuqZ8
	6wZL0myeA/Pydw1/yBOfD/goqMkhCuyChBq3v6O5cVHKyrRFbrzq8rtmYFDWRI4rkarnWkzOqHk12
	TlZHSXgD0nllT6D2DgoOXY2UpBxUiSBiQl//Qbx8W7E/EEPu8MpF6KzilISGBuWnPmB4YNoVXb74p
	ocvBZn0Y8r2cN4SzgPADILYCGx5K3gEwpWaluWD0SFjyu8Sna3goNQ/gqYYLa6DwahIJBe92evWiL
	D/jbl9MDZ4Iy+eoV6lmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmXr-0001Wh-VY; Mon, 20 May 2019 17:57:55 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmXe-0001Jt-WB; Mon, 20 May 2019 17:57:50 +0000
Received: by mail-ot1-x341.google.com with SMTP id l25so5454940otp.8;
 Mon, 20 May 2019 10:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aBj9l+8qS83R4d944kCh5FZICV9c0jOFalFfN/lgxh4=;
 b=Jm+dRAmJk4amfMTF8IHYg0rsprKSINdrd+kRQ5sbvlNhiaSSolz9xcqz5WJOqkHlJI
 76EJk1DFIEYPNXg14slyvPeNUF1MLyU6/O+tfXgykme/aowz5aF9yhEN3Fzy5WdcrmBH
 FqWRGELCwOR+MVO5ICUx8bAlqvUUmRAdUQlDHe+xPCppBv6wjiendwGU/P+5LUgvg1Xu
 k8SbLt92h3PjAM6auus9btv4lq3cSNcFIZjSBwFwBPdh1Ns7P8mjmnhsIdPGStqUP790
 V/tgU/3+KaNSd331TZCL0SzKBPpHUwRV+pLANmF+SZrfIKVG/9mxzJWYC+O8D/2ks8q3
 ogVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aBj9l+8qS83R4d944kCh5FZICV9c0jOFalFfN/lgxh4=;
 b=GXM53d8QwNnISCvEXGqCyiYuQSxMFQqxgyq+ZRvc181OUY9WbdBpQIDsU785CP5N+D
 ApUGWyKQU22rqhNzF52c0whBUzsMd/ipwuYmM0lO33UnkMchwhCBYYXwQ7oZLK0eihs+
 VH3+bXL1qluWpMQECPiUJXpeG77l1SxtjMxK9+pSyfcRxrYzHSumTN3fg69wRy6R32Px
 SZJraCctO5zTI1nWVP8D73EAzbnB+7okW09puz5MlZRXuSrHRDW4GXq7GYmdhh+yPwzL
 xLBqOHLuKzRgUyo1aTw2KPOxPKFgOnpIKOSp2dlQ6HxI+cu/QuMtICKq2UYRnQ5Y6p5X
 cgoA==
X-Gm-Message-State: APjAAAX5tOZkUX2f0FgGVyQLYnU3RqAXhinSZhnUxbO3YBnMvnAxqGWS
 K2QYqlsAzSXakJBF5QAuBi0PTayq+pPXm/pEA2c=
X-Google-Smtp-Source: APXvYqwPtuZd70oVFgnz/ZRdporflNxhgJ9AfG40Yt2pymgufhHMABwcSqDP6wbC4IbWfcsfxx5iy+4Dxo6A9QLvNEw=
X-Received: by 2002:a9d:69c8:: with SMTP id v8mr46462707oto.6.1558375062083;
 Mon, 20 May 2019 10:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190520140007.29042-1-narmstrong@baylibre.com>
In-Reply-To: <20190520140007.29042-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 19:57:31 +0200
Message-ID: <CAFBinCBdw9vTPOYcJO5kH3ia_bysStkF-bRvDtoKLn87AneBXg@mail.gmail.com>
Subject: Re: [PATCH] clocksource: timer-meson6: update with SPDX Licence
 identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_105743_202474_32878A03 
X-CRM114-Status: UNSURE (   6.10  )
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
Cc: linux-amlogic@lists.infradead.org, tglx@linutronix.de,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 4:00 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
