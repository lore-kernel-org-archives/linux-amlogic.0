Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FADBD2E021
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Oct 2024 08:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=18nrM30N7wKw3z8BhK8x+NiIIFxtwwg6fXlA6gwC0RM=; b=oOC
	xrgGcaDofE+eCCD77Lyms3qESUyBBRY++XFDX7eh/1UjDyhzGBWoOxrI65SskPYP+qA095i4lsXQD
	vCOxX9e1r4/vTXvdeJMG7LVZ+4BgACjZCMIY2888RumZTW+7nTur9Kdk1zo77rllvoKjqDF5txIxy
	pKjRTgiGTZuvgfv+okaaM9JK0jnBDQsS8CIBhntrnjevayPRH9ebXHtCFxxPFtMjezli8A0/eHJ34
	0e8hovnORkNSYtkFWl4eNXvDhNuXsMH3awD1p5jGdMK3tAj/EvvrxI9nrtmJUS8eu4o8ZRWgmOVb+
	7VFraL6S6If5UcxgBP/JXYgZe1Xb+ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WTK-0000000DVoR-3LSp;
	Wed, 23 Oct 2024 08:12:02 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WIq-0000000DU2Q-12Va
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Oct 2024 08:01:37 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7db238d07b3so4807911a12.2
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Oct 2024 01:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=videowindow.eu; s=google; t=1729670470; x=1730275270; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p+g/7cmU3nLhz9qBVrJ961xvE2AL/EGuGgKp/RuRwiA=;
        b=N3ZpWnVBCpnkgSGA0Y2JaYdf5Fipj8kkpUHm7WmV1JaSCa26wRJFCvkoMUVkfoa3I8
         k+zm6MrLxDzrhdcJJd7SPD4LSVhc5QtdgtfIuBbKDFlJ34K3sZ9wetyFRcjBOHwr7tW8
         BgHbd0YmUu1n7X+WkThO5+ZBQBMifozuSgvBb7s5LJdIW9R92sFLc4kJUnqF32qBAO6i
         bag+4dMSUhCqHuvFDM2fpV1VDoHqyXkiHNJToDhiQgC+4wT8OKvN32y0cGwFMmyGfUvs
         zyR4M541JO16q3f3w2+CuDcgKKjbzBfuzUjv9d6tamMfs8m7M1dDBVRiZpakH//O+Voe
         y/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729670470; x=1730275270;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p+g/7cmU3nLhz9qBVrJ961xvE2AL/EGuGgKp/RuRwiA=;
        b=oR3rcBekHCIiE3O7tDygIEqDnlxpEvSR0eyJfigaiht5u/0pvpPLw0RuYinYuCedow
         CXbmCtewOh3d9NgmD5mi3gbAgcHS3pSuio7BZt8CDrNT39FLUAJAeNlax04lO7WlddVe
         xqLkILL+0SL+ayU0OvoRJkU0QJavOteKm7VHdQFndfOMf8aYhqnSs9fBAbS0mz6TPE9d
         vT76cI8Z6pwrDLmNjs8M1KWTVGYkU7u0u0MFsBbKJk2RojX1pm0XwZMQDhqqp5Fe7gj1
         3ldHy9ca9ooXiALOd8yYhG+SkMuHc2QI7dYXbZuqv/A8Ha1uJIQvwBPnFvZ2PSA7JlpZ
         yvqQ==
X-Gm-Message-State: AOJu0YxpezWRUcezS6N0TsHRXq4g43B67x9y7hK8XAUdFspF8upD3iTB
	tf8a0MMtlblglzYi3j8vNcwohpNgiO5Y7CqVl2TtAhSGD8+XP96Anpk6v9abWTgHIMD4MEIzMEj
	BeD+C1PuolLmLsGLyIkJxcPJsvZu++dH+svHPsShEun8MMff/s75KkA==
X-Google-Smtp-Source: AGHT+IEmpHunE32ZG7eTN21OZKBpPix6eE/nOV0+lqmJCGqfx2s33bmHlM7LpUGh7eoDzxVOngdGGP/JHmNdyDDyaF4=
X-Received: by 2002:a05:6a20:cfa3:b0:1d9:6ac8:9b9 with SMTP id
 adf61e73a8af0-1d978b3dcb4mr2076463637.27.1729670470662; Wed, 23 Oct 2024
 01:01:10 -0700 (PDT)
MIME-Version: 1.0
From: Francisco Ayala Le Brun <francisco@videowindow.eu>
Date: Wed, 23 Oct 2024 08:00:59 +0000
Message-ID: <CAN-StX2faaw60pUqRcDtHgrovWYFsM+PGDDAhU8wbT6aeDQKwg@mail.gmail.com>
Subject: meson: Enabling full-range HDMI output
To: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_010112_585569_3F506885 
X-CRM114-Status: UNSURE (   6.75  )
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

Hello,

I am seeking some guidance regarding enabling full-range HDMI output.
Specifically, I am wondering which component in the video pipeline
could be clamping HDMI output values to 16-235? Further details
follow:

I have been trying to get full-range HDMI output from a Le Potato
s905x SBC. At the moment, HDMI output seems to be hard-coded to color
quantization limited range (16-235). This greatly diminishes the
contrast in full range displays.

So far setting the VIU_OSD1/2_FULL_RANGE bit in the
VIU_OSD1/2_CTRL_STAT2 register does not seem to work. I have also
looked at the color space conversion matrix in dw_hdmi in case that is
the culprit, but the values seem fine and setting that to zero does
produce a signal in the full range (0). The buffer from the VIU is
using a YUV format so dw_hdmi is not using the full to limited range
conversion matrix.

Thank you in advance,
Francisco

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
