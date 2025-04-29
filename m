Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A087C3ABA5
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Apr 2025 20:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=fx53OdeW5kF+1YZ4P4Yfw1Wu1m5MdgMgo/C5oHSc/H4=; b=0Rm
	nEGwUtt18ixD5LTraSslgB+WH/HuPNv/EocBrmNjHhZDguYdD/odfwYToD5GLGkJTs/2MXqPHZxOh
	ysEcd0c5W6QxwOTyAgz4OVlBtOWWCzbmut4bNWndwUKCeeAhLZk3zSGCqgQDLi/tHiJWh5C+VwaIT
	brzD/vR5B55WiSmVeCQ7JDalyQIQuM8w+rU/DTcjVcIE5B3RyfSlgiaLpXJLXNb6jmlvmHWk/uwUH
	lUywRLuoGXywNVbpTCa/Iz6ox1zcNHrAdRnTiMhQqs3dzwQsMOIDSSXqj0FxawBkr+OtmY8kyedTj
	SvKDgOxCSBfaKeHI5DDGf2Y6sm8CvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9r8n-0000000Ahb0-2ItY;
	Tue, 29 Apr 2025 20:01:17 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qB0-0000000AbqC-2xbB
	for linux-amlogic@lists.infradead.org;
	Tue, 29 Apr 2025 18:59:31 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7306482f958so2560297a34.0
        for <linux-amlogic@lists.infradead.org>; Tue, 29 Apr 2025 11:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745953169; x=1746557969; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vARjMvB0nhfVGjca7tGswogB5me6RdvGPdOvlgaJ5U4=;
        b=l7JthmfGQzUJ7bNDVJMOa1vxJXHVYdIlH88RwlB1qY+kLHu78O53YcbZD0xgMiWaWh
         utmg1XlNLqy1rJ3+ZbEeoDGBSJGG/0EyM4/Bt0yj5Lzd6GXwWxksL6JLNkBilKY/LgAI
         LlnWb43r5HuvOskFX2Wtmvalb/4ABmB9z/82azMIHrKklK84w9n8e9rDvacO4o34BmIW
         WRXdAVVZ/+cjclV0J7QWpyAqINEecNDlYGAVlIVJDE9mf7b3dyiU6Z914c0Wh6wi9wrV
         BhfTHmBrU4P7MHCjk3prVnNQl8lJOT8Y64PlUvzHxGuX0INFy0IUCE2s6HTiZOEzlLeG
         5now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953169; x=1746557969;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vARjMvB0nhfVGjca7tGswogB5me6RdvGPdOvlgaJ5U4=;
        b=m+4G7K84SyqhtTokIz73aM/s+4nhph+bosHwVhwvaTmjnomSqXxdXCp2Wn25rh0vfz
         6tCbwtPxufVTLWOez8qr+JrlnoYIwzfM6geM6OZWWRYZv5R87OD2RP8YObOqvmOIaIrU
         W0ob/1S4hzOpxxq6uVNboDf/x2cIzuSUBYLbaeVS/9G18ry2Gc36nAlq7nwP9lyGBvZd
         RQssYHLGcEqTOGNPNDN1QMzLpTEIYgPu+3NJT9kdHQ+J83nlLLr1by6cPi4BlmoBqwqO
         3CmMFMNIQRRAC8U0kRG0gns3da3L+vFvy345327LD7JsLFrUUziG66pIdVO3pPmjySdq
         76Vg==
X-Gm-Message-State: AOJu0Yw1TA1Nvpl+62LhEvfz333SGci9P0SYD/nUFrmiphTCHRdYZ6iF
	BsvHt5yfQfJERq7HZEl1gPfXQw6d5Slc6YB5hE1wqcDmwQhCNfYk4VXujnxq1MvifXXsm50K9sg
	ujatGnfXgb2tWUFINfWQ34PZzXleOLyXK
X-Gm-Gg: ASbGncvTT5ka6s5vXaPIPr8d4iGbiVugxvVWz3pE3m7qIXTHXMLA5Dzej1Qts3CRzqD
	bE7kxKY5G4xFZhg7Gw+OOEFvOwdLk/bwBe8ak/p9Ozss7z+lGkKBlgv7NoaLT+EuQqpEAojyodI
	UtYF0BDh5QnjdNV0AWBDCX
X-Google-Smtp-Source: AGHT+IHKPy653i1WsXkjEKOzWRnacuJGeI2uFUr7XM3bgWJQAQPQf4jutjOzzufU3INWsROSGsmzn8iB8sAqE7/X3qY=
X-Received: by 2002:a05:6870:168f:b0:2d4:c19a:94e5 with SMTP id
 586e51a60fabf-2da6a3a11f8mr87140fac.39.1745953169401; Tue, 29 Apr 2025
 11:59:29 -0700 (PDT)
MIME-Version: 1.0
From: Jeff Sacksteder <jsacksteder@gmail.com>
Date: Tue, 29 Apr 2025 14:59:18 -0400
X-Gm-Features: ATxdqUHQXBWa-E2j5lzfSVWBPbe54b-mXZUfoq0VX6UUjxTGl6n7ErXr9mD8zV0
Message-ID: <CAOgeiBY9nLNS8==Z_d4PQQ-Quyp89dSD83ZmuGHOMkFXmd=AWQ@mail.gmail.com>
Subject: AML-S905X-CC-V2 emmc issue
To: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_115930_744780_41F8517E 
X-CRM114-Status: UNSURE (   7.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

I'm having a problem trying to install Alpine Linux on to a Libre
Computing Sweet Potato AML-S905X-CC-V2 and I need some clairification,
if someone has been down this road already.

The sd card is detected, but the optional emmc module is not(per dmesg
and /dev/mmc*).

The suggested distros Libre suggests work correctly, so I know the
hardware is good.

I don't know if they have magic patches, so looking for clues
elsewhere, the current Gentoo image for Arm correctly detects both
devices.

The first obvious difference I find vs Alpine is that they include
PWRSEQ_EMMC compiled as a module, while Alpine does not configure that
option at all. My operating theory is that this hardware needs some
bring-up power negotiation before it is available.

However, since I don't have a cross-compile environment available, and
it takes 35 hrs to build a kernel, and the Alpine build process is
convoluted and weird to me, I would really like to know if that single
option is the solution. Otherwise I face multiple 35 hr cycles of
building and testing.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
