Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4A7C43458
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2026 07:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e+MV+3uMtrpxDujwzGZvCTCZ2tNYTBQVe3iSP9egOmI=; b=p740ZXynZB0vu9
	mbBS3Oa3kEMme0Lf1gB58xjZfHwXYMa5WcVYsnfcwU1H6dulFduHVIieOO4hWwXNqikryjy/jkisd
	aETPe1P8Cr4wSPo1UN60U/b/wT5EauK/32AGBGGpP2sCyVwfznVxdQEwUZB9wP+LBeUoBB/IE0mRM
	3u6RWhsvB7XCC5VjWs5TmAU6SvhzgXOCNih3bw9Ps38M/uSvtlTTOi87gaMzDZAOWpvx/bjbVMDhZ
	ZWRHI5AlNF22+MbMX4WkFEKNSXNcS9eexVrsUkm5urhwDX1AhBLY/BqzivWbBm2SfprWvFRa5stlG
	7e0vWpiLH33cJpa1e0Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXMw-0000000B8o8-00x6;
	Tue, 14 Jul 2026 07:15:54 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXMt-0000000B8n5-1Et2
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Jul 2026 07:15:52 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7eb5a9f02e8so1993962a34.0
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Jul 2026 00:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784013350; x=1784618150; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+9VXYQoFKrduQQaI0MXfTWAOznl3U7BNrRUoVoj9CU=;
        b=pO1J3rNXH3MywS38Ip4yccl0CgrKLOnTVXSKlMHFizVmtLSbqjmkyIFvz+tbfyo+28
         +ayXIbTGN+MX6Y+jQX5EMmS03rnYKwJRor2T5U950Z/Kzp4pDN35c2VmwFEN6c+5Z8X+
         Gamv6KbVwgZdFvt4fKOMZ8T6GT0OKJsd9rmiy4KJFFST9dF8F/A2gVxONSn4fjujC2HT
         sFS6g0Ww/qveKnWCk/0Ux4AC0WlGbrgnEogvvvLvpO7wlhYfEY+fv2/RzLr1yFE9i/Cz
         hTG91oToun6ja1YaOpz1GuAEene4MlCiSpyoNV2soUH5UnkLpZ06qHPCRwm7nRtgeIv0
         GJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013350; x=1784618150;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+9VXYQoFKrduQQaI0MXfTWAOznl3U7BNrRUoVoj9CU=;
        b=VsTqboTSyIl95H5GtrACuHDe6/I44W+HekiAg8gly+i3jr5d7E1UtcJzMYCqFS6UfU
         ifjAXcLjfuUwJ4gs6lfFkY5pZRuLckU4iQMG6hakGf9aP8tMHWsc8RtYQZ4ERqldrZbD
         NYGGI03KYzG7kt9M+KvCWdkW7kOj05VZhnVF+1YIUwadEEyVw9s6Xw6F9janpMDTVhTV
         5CGaZgI8tdBHyYNJWjmLYK4p2SUUKBhZOCejvE1G9e0nfFy2Ne+1e5TIEaQCMwdm0AYX
         7HP6eBvW2GZPikhwtgLJndPAdK7jWSBFR3ugX5P214TN+ci5Vtl4hGlwVeqRsn7vuddp
         DQmg==
X-Forwarded-Encrypted: i=1; AFNElJ8hJLD6+JFB4bfyJ27klmFLqa/yPNwDGXLctPGWyE2i4V/X69Cg6/qIs5GjBcO3pHJ5bRZrJqzU1dfzoqYu@lists.infradead.org
X-Gm-Message-State: AOJu0YxEJUrj1SGzUIG3j+RXgwd0JAAErz+cumSbPcSuVRg15gXyvWSE
	//Twgsyliyiv6n13BqUjPdCNJQAoudezlM1dRAUEmF2RXS1G8Ax+Ow5V
X-Gm-Gg: AfdE7cmevQ+ivFL6k6j/E8JvD8O4WR1eWlOABvNH28zMiY0Jv+3/WeMEc/1WPaHFIAx
	j8PTiRwg+94gRdrMfJAkmJKoJlHx6CsRGvwMeyvZ+uI0Ne84wbgqKchtEIFuvWKHHH4vYaPcisG
	s9kNIiln8GV+d3dGrg7n9wSuds0GTWgTg46wb+W/GvhF/oOPnrK+o7okUIHfG5FwyqoNmOHzpZ3
	T70kM864XZ/jdaUSlKTuWNwxOmykKWkK7FHWgIy1RSElBV6UdSAxBtOAsXlrCVZBIxPrZzDvXFg
	gC/n6Aa4qx6TmkOvAdex3OM9Y9+Xy2umHpEktpMW4GDYA4Jj01jsBUzV9fGnpSgqttMKjSKX8ZB
	7AWkXZ+dZOyHQNcGy84GhKsfaqc0p/9c+qgUnVcJDMpwEBbFF3DMsj5kw+Dc2azQ29HR5HFGyeo
	JOT6K8
X-Received: by 2002:a05:6830:6b05:b0:7e9:c481:ff8a with SMTP id 46e09a7af769-7ec096782c6mr8345084a34.11.1784013350259;
        Tue, 14 Jul 2026 00:15:50 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ec14489139sm6778498a34.5.2026.07.14.00.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:15:49 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:15:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alfie Varghese <alfievarghese22@gmail.com>
Cc: neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: meson: vdec: fix advanced concurrency
 and UAF bugs
Message-ID: <alXiIGfZjTeaD7gm@stanley.mountain>
References: <20260713181602.773-1-alfievarghese22@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260713181602.773-1-alfievarghese22@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_001551_333942_7EA354D7 
X-CRM114-Status: UNSURE (   5.18  )
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

Please slow down.  Wait 24 hours between resends.  Otherwise it's like
we are hovering over you watching you work and holding your hand for
the tricky bits.  It is overwhelming for maintainers.

Follow the other v2 rules as well:

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Also say that you are using AI and haven't tested these.

regards,
dan carpenter


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
