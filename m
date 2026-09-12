Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA632C88E50
	for <linux-amlogic@archiver.kernel.org>; Sat, 12 Sep 2026 00:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vcljDz6EbmOeJgRkQb9RW0snXlYToINWUFvfV0tDMKg=; b=21QtyxcpBVhecd
	vNrXqL2MocCm8HvmxbuQQfklSqt9dc4MVFmzG0Hn5L2ilH8x8rHdNG2s3Uc7UiCuAmaFF+muIo/Vz
	7TLqBKAEuwHHlLCx64C6Ybjadana2oJWnw62/73du6g3pEjQpHp4BJowpQjJsYkvetWXxE9Oztpi4
	egSUmi4oLwDgwqOoA5QnDQlySA5AZrBVrO/k+4GeSrg8B19ZcqMEqS6hwU58ErDduAunrSIHnObWf
	ZvcKez9ARM6WUXztaLUYa+9kYaaSB0OzT8HIqqxH1KNxl8HCLbcS0mDQs8KTZ/V7p4rGJ4Ea4rV1X
	zYq8arpYRMvIDSKFPZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BIM-00000000QN6-0fyI;
	Sat, 12 Sep 2026 00:08:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BII-00000000QM7-3YXm
	for linux-amlogic@lists.infradead.org;
	Sat, 12 Sep 2026 00:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789171713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r+e6U5jGD86yqBXhoRz8wqGY9P2a9TSeSSbA20YZjfA=;
	b=cDAU9CxDuVkONls6UU0DGwFo45VWJT2N581EIoOTN9gmsJsLjIiaplJOjNfecXe+mmFO2t
	x18bjLb8DPQI2mFmFAgG0EiTj34qX/zC31M3agXgBPLHUy5T1j7PLjCml1XC123CQlLBg8
	jTU4HFF4vFlr6DjC/ZlFAwlhOYxrwSA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-pVbNAG-NNeKSbqenKN3jNw-1; Fri, 11 Sep 2026 20:08:32 -0400
X-MC-Unique: pVbNAG-NNeKSbqenKN3jNw-1
X-Mimecast-MFC-AGG-ID: pVbNAG-NNeKSbqenKN3jNw_1789171711
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e87478402so32760756d6.1
        for <linux-amlogic@lists.infradead.org>; Fri, 11 Sep 2026 17:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789171711; x=1789776511;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+e6U5jGD86yqBXhoRz8wqGY9P2a9TSeSSbA20YZjfA=;
        b=l74/hq2toG1AWWMfN/3ebJtx8G3ney/HUb4yJHHGsTQLjZHbH13Vh0pAnSvOj3ebnF
         RxgAdVXb8bqbhQkWSrnCCOCoEFHHobCZpAZKT7rbUWvejS6Uwop1LkZTxu0zFY9N1ydN
         ZPDQfCWDd6qO44H76zS9PNb++306IHWYqZJbN+d/txPjgd6edK8GA5cZRNVibPkFyFRN
         IJRNW/8e25J1bBz9ilgsssSUxIz01uJqJalMw6f9yERXLu+AoB8Saa1mJVwQiYU66Qf2
         BSwTqNaPsOQuR5917f2vKVX2lsYR1c8uxoX2RhrdbiBISdftutqjTu3XlTq7qqADA7je
         tEhw==
X-Forwarded-Encrypted: i=1; AKwUvBzHOroxmD6B7bKgS5lIJEckIjwoO491yqhANMlYJ7e7TByThEC6gmLlq5ELPxBiCab43fPCs8sdOLGsEMr8@lists.infradead.org
X-Gm-Message-State: AFuF++mvfk7ld4y0z/gP2UyuEjS17CfPVm2QYVPhquKkXJTKGbq35STC
	flRFPiyc8GppYOtU3NaYOxrKX8oFe1gCaupSVz542YIYK8L5yeQy+SJS8U7ZvwN9pq7miuXmODj
	Eul+hQSEiPHoyidAtTymClQiYZ7o+8Uxyf63D9J2p9dYxQZqrPereslZ5BiGmIGVOAmm+TwCa
X-Gm-Gg: AYBFou3GaFgeULCI7d8AiDoXxWwbEpeiKbQOJ2VMTjm74vxvwtrFEwyHsooAyX0BRyQ
	KglleGfCs0L16fxRZAutbQmSxTbABA6nHIvMa/vP1gBQ+tkKhrMr9LfEPx4zhtMykH7jT3EG4Z5
	79TKvJT06FOKYsew4bYqDC1rEiEyhuxMMDhsy62X8BaUwqwsL+JzTOD8djtfZO505drabLYN25v
	AULOxHv8jsMmHAWiA2ejIHc58c5xdPrbkfwwPaNT3O5Qs0OQH+5ykCajdyG2OmOpTHVD8usKPzb
	fFgApUuzxoZSCNc8gx7AU6Do8x7I45RHY9+XN3gGU/InN/ywklPeqiBMLy+gJyEL7xCU+xrdfoW
	pL5zByWyMjtCpQ5pKCTCQrlQTlxTfF2JduRY=
X-Received: by 2002:a05:6214:2307:b0:910:722f:b8b with SMTP id 6a1803df08f44-9121da7621emr10926856d6.21.1789171711296;
        Fri, 11 Sep 2026 17:08:31 -0700 (PDT)
X-Received: by 2002:a05:6214:2307:b0:910:722f:b8b with SMTP id 6a1803df08f44-9121da7621emr10924946d6.21.1789171708976;
        Fri, 11 Sep 2026 17:08:28 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f20367dsm32915306d6.6.2026.09.11.17.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:08:28 -0700 (PDT)
Date: Fri, 11 Sep 2026 20:08:26 -0400
From: Brian Masney <bmasney@redhat.com>
To: Lucas Tanure <tanure@linux.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as
 critical
Message-ID: <aqSX-kUvYaixESxe@redhat.com>
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-5-tanure@linux.com>
MIME-Version: 1.0
In-Reply-To: <20260905153234.133217-5-tanure@linux.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5ne6V7HjeQvXbExjKfcmdM6g2eCWZBP5dvKX2kAmK30_1789171711
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_170834_955259_5CCFF26C 
X-CRM114-Status: GOOD (  16.67  )
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

Hi Lucas,

On Sat, Sep 05, 2026 at 04:32:34PM +0100, Lucas Tanure wrote:
> sys_ampipe_nand clocks the pipeline stage inserted in the bus path
> between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
> identifiable consumers - the three MMC controllers - so marking it
> critical was the wrong tool: the clock should be referenced from the
> consumer nodes and claimed by the mmc driver instead.
> 
> Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
> sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
> have no single identifiable consumer.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
> This patch depends on the MMC controllers actually referencing the clock:
> the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
> clock must land before this patch, otherwise the boot hangs and memory
> corruption this clock caused are reintroduced.

This series should be merged together in one tree? Which tree? I can
provide an Acked-by if it should go through the mmc tree.

Brian


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
