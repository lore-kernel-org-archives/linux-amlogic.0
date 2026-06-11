Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3A8CD98D2
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jun 2026 08:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvFvwNOJZ/k4Svpcl/g19v2u+QVWNoan4qiIvUIJGNs=; b=cKpk5KQL5RDCvE
	wxjI+z1kL+WJUT85I3NtZaYVZP5erXLI05Kg7Ca7b0LfS1kBZRlZ3ee1oq8EwYV2dVhHG47OBjWAV
	an/4GzF02BDlqwNbQPw0pJ2qDgKExqdnwqF0G+Ei0b9FozxC66SKaNzRGUCgutuA3Nw/XjL4BK9Cl
	EXQcysdD8ejBma9/DYKI8Fd4dvs6z9kbzowS2ILgD/S74fprj/obScvq7zptTaLz7kuTk6oDK3RsQ
	/al5Lly+P7gLaDyX43jX0e2S8qFJb857Y9TErfWp6m0Z1lzoL+TRmR1SCsVMuoVB1BJLUaXQe5fxI
	sdXQXeGIXkdTdepb0czw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaUt-00000008y4D-1P8K;
	Thu, 11 Jun 2026 08:10:43 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaUp-00000008y3H-3109
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jun 2026 08:10:42 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-45eeba68948so5494470f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 11 Jun 2026 01:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781165438; x=1781770238; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i8WaiBhZCg2JUQSyC77l4KARDvtWcKvB5SXOsU+dVgU=;
        b=FP4qmyzMS/OGo34pTIzbP5QiKUvBu/3IplUoQL8IOk8kr7u45rDd4tLtlMTBaWLnoI
         PWwOzHtQPy5xSKm17E0ec6HFH3ughwfs4q5uAExUsoadZJXVzQbyUnyRarbmqLYFZnQJ
         cxoW8KbQdPfVybCbzWq+n1ETWllwRbl8Ze25ync298twTNFrGS0dI+VM0Y8Rj7V3Z3uz
         ZZBwNsOGSOBqLtmJNJPvVXK9c43Op2ylOnT3ELz19mqCHrhohYEMo/3eD5IJoVvTag+v
         dgtHhXl1Ta/WSVAyyPV1nlaApol3yl4ioxkAoKpTJcxdpYrTRlDmsW8c/Ot2ugkFtWK2
         Q66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165438; x=1781770238;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i8WaiBhZCg2JUQSyC77l4KARDvtWcKvB5SXOsU+dVgU=;
        b=rSduVVgFRAXwxdIeRDdKCfk4XBuqh5E8ztV33JgVksqX7cdbeGn4g0n0X9N5cmxERG
         UbVw1lOUyC7gLVyn2LL+YGS/7KsIr6neVWOYJrECGxR5tUPXsNI7qSmNKLSY34PAUfBq
         R09Q/B0VVdv4WvjLOB2X9OYH5rldxxEjz7ydF+bUfZhNL/ZtC/kaGc7kz+I9O3JResJf
         AnGJR1lL9tVCYX3jpwczcJ3UkNHFQWGulEbCYK3cvclURMoQW5QcomCer8bFzYH/CWHH
         rbVf1v/6lbD1FZiinz+5nRqGexHR/D2nFkffFAk8VYDZ0A9dO3c7VjNzoLrnMHuqtsa6
         z9Rg==
X-Forwarded-Encrypted: i=1; AFNElJ+EzV5GczRZQLzhHLxcXswZQxyuI0+airi6t/R31bL5M/ovsSOvikhAQm7saI6mDM0FWEqzyovieB5P1VF1@lists.infradead.org
X-Gm-Message-State: AOJu0YzdYHUn4G+uYqZr4c6kvVuZrynTtIhxWUfYlEgRZ0Gypu5/IBej
	A0sUA5eRJf4AloCPB7iuk7d6MsFDqA1jBNbH3+9jGMXJYI6qgHidZOQ3I28oWfYI35vUpLmjicC
	PTGyMygo=
X-Gm-Gg: Acq92OHjGc/4hyHRFKInk7zy0ohWAwlnafxWflsmns1y/u/LrSl4Dy+pvU2u44ZlQNh
	6BHVY9XpwGIfCqZLc2YuinFnaET+s7E8j3gCKb5RZz5Wwh+3pMh2KxsEKXUbVy7A5AJTkOie6+I
	GobCIjoOaEl4QTCKJ4QHyS5S2Gcs1wQIbiHPfDSAt6ppnxtsLOEzoB3Jf4ttMzHywXaZZM9S15E
	IZZhbdIizuPadwvcEmObpZar3Rd4P+FD3qBl2qxiAV0kajDZLP/8wiAW5Mj/HzNDVA5uZYNP3dF
	AFWLH/QFqm+QLgJCRi4a4CqrvAFzILGk24fU3inlWUTha5Gt+G2PIjiEKlZ2ksiVbR/SNTZgia+
	+qevLJAvl1ZNb4rQNzzVvmsjJwKY0ccuEkJxLhyHoI2NaeKNdqKV6Io/YSWpbLvF51hQsPbXagP
	7kRfYSSfBRhwqK/EHxE4J1folI+jVABNk8um2EjFIaRgI=
X-Received: by 2002:a05:6000:46dc:b0:45e:ea65:d329 with SMTP id ffacd0b85a97d-4606758d002mr1861604f8f.7.1781165437896;
        Thu, 11 Jun 2026 01:10:37 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d1b:88ba:5161:3581])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f2e4004sm78864656f8f.9.2026.06.11.01.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:10:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex
 locks
In-Reply-To: <CAABR9nGC=f_hO7FX2RnRHLb5D2Tt9=qT_yv-Fv2y32AAoQy+sw@mail.gmail.com>
	(Bui Duc Phuc's message of "Wed, 10 Jun 2026 23:27:09 +0700")
References: <20260610102153.83367-1-phucduc.bui@gmail.com>
	<1j8q8mfte7.fsf@starbuckisacylon.baylibre.com>
	<CAABR9nGC=f_hO7FX2RnRHLb5D2Tt9=qT_yv-Fv2y32AAoQy+sw@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 11 Jun 2026 10:10:35 +0200
Message-ID: <1jo6hhebus.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_011039_807623_98709088 
X-CRM114-Status: GOOD (  17.49  )
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

On mer. 10 juin 2026 at 23:27, Bui Duc Phuc <phucduc.bui@gmail.com> wrote:

> Hi Jerome,
>
> Thank you for your feedback,
>
>>
>> I suppose it is OK but it does not seem to really clean anything and
>> make the code easier to follow in that instance, from my perspective at
>> least.
>>
>> If there is policy to systematically use guard() whenever
>> possible then OK, otherwise it seems unnecessary.
>>
>
> I have noticed that guard() has been adopted in several subsystems.
> Since this appears to be the only place in the Meson ASoC code currently using
> mutex_lock()/mutex_unlock(), I converted it for consistency with the
> newer style.
>
> Going forward, should new Meson ASoC code use guard(), or should it continue
> using the traditional mutex_lock()/mutex_unlock() pattern?

Can't say if there is such policy either. IMO it should be more a
case-by-case thing

The code is not better or worse with the change but you went through the
trouble of doing so, if Mark is fine with it, let's have it

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

>
> Best regards,
> Phuc

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
