Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A74E7718A
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Dec 2024 09:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLxFX0xTe+SyqM9a7y9iY+do0uk/x3ZxBVAqmykmkMA=; b=cu0CUjj4VFCJNA
	JqNJgpKbY94XO72pGfypiJReekK8E4IT2jJn7289fhwcWvklabXqQ2skVqp6J9T7nYmpN6ffnrvOZ
	8gzv5FO7TigeDQV8px4K/+OlDcZIt/1UE763M1RZjm583wUgDwk1QNFdaTRvw4zgE511E/SE/HRxm
	O2v+j6svMhduB0/rOmIH6amCy/aHrV37Hw4IXdFwRvBC3vhUWmX6VeIPN3TT1+pJhUyhgK8aMgbNV
	KJQwyl2ATCZlMJWnQtyRA8XDfUhnM51xnfGpKIfi0BM3OfQLhvmYegYKBBxSnh8Oz5HAoFdPol/YT
	nfwm4Y87xlrSg85Ycujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZGd-00000004Pz9-03LW;
	Fri, 20 Dec 2024 09:25:55 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZEf-00000004Piq-32Q1
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Dec 2024 09:23:57 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so998796f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Dec 2024 01:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734686631; x=1735291431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNCwTAAXeO7cfiIJbpT278fKLSv6GPfZdgeicUTKEO8=;
        b=Fo6fDgAhvN2sN5SYV2TTftIhQ42ZDcRea5owKgx+ALz8BVPy0N/0jl32Tz4O9f7wfq
         iLqx/re2z61BTbMVze+fJ7gpRHzzpbiw8d//uYzXF4gMDzNSzIDltc5yPJ7B6F+aJrG1
         FXwAMm8qEIZKR4TUCZzfQt2bRyyvi6lcS9xeV3X1FERwpF33A5l57R5wzaKRj0/NB7Cb
         pJFa9RZl/WsYbEj9KuncsFHzvs1eeXddB+0cWaOGT1LUPEVWIzw/pLao94lvGloyj/Oa
         PZJA0V6eSbHjZEoEhZ7qtCYg5tXw1C+mYdZzISUZua9lBwE9Z7XqQzYcM5cy6ZwCAiCS
         zS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734686631; x=1735291431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNCwTAAXeO7cfiIJbpT278fKLSv6GPfZdgeicUTKEO8=;
        b=NAHWPkO1xUmqnD+I00syO7AYWsdj66QuixfOcXa9+hskfLKW6G3Djvftmnh6iMFVJ2
         zrrY05W2wh7QqfBw0ZUKohxPXIkYYglwRjUEr5yKM+00h8a/CXdwM1vWGn9kR6+S6fxW
         qRDLAO79nl4VGUCqllE9UJlj2x99MA3OfDyvv4oYGtmsW67H7hYetcqewHq3ePk5V6hR
         iP4+olKc9/Ma4+DvUO4dT75H5HqGWsP4PfJ/i9NqmNcwiXzHiCBbc0FJlOQ5AMdnr22N
         A6HJkulH974ag18TGUKumljThQR9tuBeFfshVSd5GudDjc4HDu+9Aewm2A/U6sbDOVOp
         BNuQ==
X-Gm-Message-State: AOJu0YztlLG/JOdWlaINciZ8iFRmAqHVprmOQ0FhnUc9gRf//QgI5+dL
	etTcwNH6v6H/piWr3yLAXFGE8ntJCOALs3yXg6iq534mZ3bU5GSilID3omvpbX4=
X-Gm-Gg: ASbGnctOdEyvhLdi1HqyAk8MFAQro8yB9XRi33IBsewuwhuIZ2Rqv92iBSuCTBmMZPs
	860Rgpb0tQqFULtbqR2nrWo6QMy7OXf9JESRTmomwKrVuUp4F65SYrTleP9+RZ/t9muqZNC4Km/
	0QKpMHdGx14rsmhfnCeaRDvmFjdhzo0kIn2C+y/CRZYtCY71TM9Am+57/W8VTlcKGDFXpCd3uWR
	x4oZ6tnmXzETUYNxPmCueVYyA3XneTa2enJvg55CCJqpO77tkp1fwkdu84=
X-Google-Smtp-Source: AGHT+IHCGJuc0QPgWiSCcz1rPztAry1sR+Zkfuc/Y/QNK+fl9LlKGIVA6ytnJgB8Y5pGXPIW38hmKw==
X-Received: by 2002:a05:6000:1a8f:b0:386:4034:f9a8 with SMTP id ffacd0b85a97d-38a223f5c51mr1646408f8f.38.1734686628582;
        Fri, 20 Dec 2024 01:23:48 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c828f8fsm3538787f8f.12.2024.12.20.01.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 01:23:48 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: amlogic: g12a: fix mmc A peripheral clock
Date: Fri, 20 Dec 2024 10:23:37 +0100
Message-ID: <173468657763.2759236.17472540885807657211.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241213-amlogic-clk-g12a-mmca-fix-v1-1-5af421f58b64@baylibre.com>
References: <20241213-amlogic-clk-g12a-mmca-fix-v1-1-5af421f58b64@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_012354_022096_55B90A92 
X-CRM114-Status: UNSURE (   4.13  )
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

Applied to clk-meson (clk-meson-next), thanks!

[1/1] clk: amlogic: g12a: fix mmc A peripheral clock
      https://github.com/BayLibre/clk-meson/commit/799ce46951dc

Best regards,
--
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
