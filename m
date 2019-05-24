Return-Path: <SRS0=5BKV=TY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EBAC072B5
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 18:19:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ABFB21773
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 18:19:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G/D97ai4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="fLbTFdXK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ABFB21773
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1uOrLbM3WLRJxYqyXOSdjYOekIktaFV4n1Ryfl6J9d0=; b=G/D97ai4wpRvY5
	vqTQTvUZlQ309RrVlotkTiojpR0X2HuGLmYfh7U1RsN1UfyhZMJnPpm3WAwMH7mnBahjK2Vvz+sIS
	4zgPgg9sbh7SYL/Nt2jDS9FwBsUoWY6QBcj4+d6VN6YyLt0Bg8DIfXCQwprwHic9pvspoA31zuR6K
	qF+bq5XcbQQdsMEHoGhBOUv1CR5p5y1UcH752VNMo4kAXvMYlX8fMJIBzyAj+wNmyAoPnhv8hOlOI
	musIGOrUrsXYOZvRhQZtK37EyLACg0FvmFkifPuoO/LDs+f3l3NNH2hzX+YDnweeb8JJ8oHXXOObL
	BuJNb3mc09ZXLZxRS/PQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUEnH-0003lk-NU; Fri, 24 May 2019 18:19:51 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUEnE-0003l0-Oe; Fri, 24 May 2019 18:19:50 +0000
Received: by mail-wm1-x342.google.com with SMTP id x64so10280424wmb.5;
 Fri, 24 May 2019 11:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+8J7+u+08zw/YayuZerzF4YvJ/C2JcgVQ3UZvTM8GdY=;
 b=fLbTFdXK/qHCokY3RRGYYjK9b5BKrl51TIo5xcbU/V1w71Dwmb7nnguqE/LlutxG0X
 jFWSeN4YebgtkduKqxhKCmUhJN71XPTkHNuphOwT+PhHlXGKEqoPjqr4vDenJW+pRhSr
 SwbGlSXdsq4MLZIC4tkbWx2U4Q56kzhih8EzIwaxMyzEubYKrtXsuvryQ5CqrEzKHEKW
 NYkdXaA+BQ/6nSc9CrC1OlIMNM5+CkferqlCSyzGNDD0MKPmGAqThxGX6gjZZy15Z7up
 Riq/QbxT1I2YIcTXhIKxqNKGD9wFJ+hN1Fq3s9VHiTRIJ95MEy/gHTjuhJzAFJyI2S6s
 oooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+8J7+u+08zw/YayuZerzF4YvJ/C2JcgVQ3UZvTM8GdY=;
 b=r7Hr2hph1LC7HMDF+QjgdlGWoX3pivpGlyHRAxs7x55dfP5zpprZKS5Vz104ny4oyM
 5yl/ycCZGu132glm0UIEUkPGEAFTudpE5OlMA0AzHtuUrKzjzfJwYWYD9GKoF5XMfk+9
 l4HrRErbZ8NtE5fqZzBIpWWZ8g8Jm0HBK64Gre90m3LqkVvke8n7lJAFzJwhNKNrx3dr
 s1cwzNptX3BnC521tTygHCF6cV0BsGSbFix4g6mIUzfTOQGALjzjGnt3KGKlm5wKNZIB
 ECKWeURVAiyj6clCIe8Nxf/7bknXdVNchhAH6i9F7s3g+ruNbtIPmfA8KWY6naLTYV+v
 nIDw==
X-Gm-Message-State: APjAAAU+QEkE3ajjSu3+bAWkwljNTjnhvcSiHZxgT+L8HhcTtStscH88
 XtNV9zzjoSZnUGiA349AQ/RHk5pg
X-Google-Smtp-Source: APXvYqxqHSt7C6QxdYYFU1OJ2baCwFXbx4oAQnj+bTCBMrHIlPHQxmVND5il/ViRVFU8xUfrGuis/Q==
X-Received: by 2002:a7b:c40e:: with SMTP id k14mr895213wmi.114.1558721986483; 
 Fri, 24 May 2019 11:19:46 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133EE7100D0AA8776F4474B72.dip0.t-ipconnect.de.
 [2003:f1:33ee:7100:d0aa:8776:f447:4b72])
 by smtp.googlemail.com with ESMTPSA id i15sm3181831wre.30.2019.05.24.11.19.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 11:19:45 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 0/1] ARM: meson8b-mxq: better support for the TRONFY MXQ
Date: Fri, 24 May 2019 20:19:35 +0200
Message-Id: <20190524181936.29470-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190524_111948_851004_72DDC29C 
X-CRM114-Status: UNSURE (   8.26  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 hexdump0815@googlemail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

A while ago a user asked on #linux-amlogic about the state of the
TRONFY MXQ in mainline. I did some research (mainly downloading an
Android firmware image for that device and looking at the .dtb) and
updated the mainline .dts accordingly.

I kept this patch in my tree but didn't hear back from anyone with one
of these boards (who could actually test my patch). That was until
today where I got the following message on IRC:
  any plans to submit your latest own version of the meson8b mxq dtb
  to mainline? it works really well for me and the one in mainline is
  too simple to be usedful ...

Thus I believe that this patch is finally ready for being included
upstream!


Martin Blumenstingl (1):
  ARM: dts: meson8b: mxq: improve support for the TRONFY MXQ S805

 arch/arm/boot/dts/meson8b-mxq.dts | 139 ++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
