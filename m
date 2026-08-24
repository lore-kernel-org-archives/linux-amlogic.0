Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912FBC5DF94
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2026 15:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjBVe7uGN3Dnzs1YOyIdr06EPejgue9kFxZaPYRocLI=; b=qNORgfHyEeJj2F
	QE9QWfjfkMBKgoC3G+krwZyVWvh+1NwrUd7IN1XI2mQKwnBTKKy8iT/WGn0WwPVYu3QEYnnNt6xZ7
	SX/c9vo+qZHNvpGyJ2M8gR30ddUxE+A3sCeUvwD7V8eqXrigO59ZfQCkp0xXVCyjVownDCzBI3S2R
	prI0l/7G+5qrKOgLFpXZfBhRTrg426QM8wvcWBEh0qKnfYf30cPm4C0lqbRv3k6a9dZ0Ty90vQW2s
	A2m+fM2Nyh6+FPgudl4mqclo3BQYr4uooQXlbOufAqYeIlJriJwterYTZhK/3k6UwNrc0PFnptzYA
	3eMejLrGKzVSZLhfjlAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWVV-0000000GuXD-1yVA;
	Mon, 24 Aug 2026 15:22:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWVQ-0000000GuWJ-3xKh
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Aug 2026 15:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=He6RFHl6rq/FSWjt0HcY9MKwV1uNr7NSbctKQDp7TZo=;
	b=MW/GyNL0BCUbO9s8h5DZRO525c7oEv8qpvqeEUUejpk57p+O8Vk/ju4V4KL3wgAoS+sJZg
	dIovVGNr1OOolpRlFbxaniDQ8F48qpYQFfQCfp3GuSp63/+vM2hDSnKvPJ7//ECaqsQWPk
	zivuQwFIeRK4I52/ivuVt2T7WBu/eW0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-lBAeHQpXMoGB5rA6kWCYkA-1; Mon, 24 Aug 2026 11:22:34 -0400
X-MC-Unique: lBAeHQpXMoGB5rA6kWCYkA-1
X-Mimecast-MFC-AGG-ID: lBAeHQpXMoGB5rA6kWCYkA_1787584954
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90c8da50fcfso21007386d6.1
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Aug 2026 08:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584954; x=1788189754;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=He6RFHl6rq/FSWjt0HcY9MKwV1uNr7NSbctKQDp7TZo=;
        b=KLYV6lDe+xlHxtyGqSwENS6bR1lLXLophnjD7NRNBCHY85SpjOoRG8q3ovQpAoYm1u
         MefFNNqaeO5KE8LqwTJ6TINVhsLnPZ6m1ndP4EM6LHt4TujELJ97JcV8EjhzYC+7aHwO
         2sE4O6WJ7u5ce3XglJIqtPFMTwl8GZJIh2Mqh3Q2C15SNVavuRk7S5uJaQK8sYCp3slf
         qbqH+QKKVwK964aFXs2F8uxWIK8MVQnElm3LR296BnloODPtfhR7xRx+9qTyZkJz+fpU
         1tK/3jTfY2PpBBd8ZEkEUb6BUnnFFNWplWFE5/mAREsmjc/9LUhd7mIwpl2OL/IQUdKs
         HfOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rop7AmiRUVZXfa91djto/ChwiL3P5dg+4yYlLeDacklyYJNy8mls/mejT5HNk02Ryznmag4En4UfsTJjToo@lists.infradead.org
X-Gm-Message-State: AFuF++kMHeVsaPwXJ4TC5U39jH0AO8IpUIHitY5gszVnrNu0Rbb7A6Xh
	SxWu/2Jt4faNenx69/7QfNNR9Aqdd6gfqMdrBl1gZIHq6CgYl7GgqlRxveTHU/A8V/p2V2hgBcj
	XnYvQyQ71YWZlAiyu4NkCmPa5c6mK1a11g4ywTrTxu0JkpHO7VN3xxH7+nP/JMqOGDAs2Wmtj
X-Gm-Gg: AR+sD12oBLWGSdYy0KY6OiXLMNgtN6bv6WnJfi/zbov1jllbbLKTP9ecGfU0KvV0DDN
	paUZMz1UnY84d/4L1YdDLU7tw/RM9rU3okhzbtvbFYSJoPhyVyLvJuE6LDTu0j+vRcdIvsmwSoD
	8aOoiSLJ91dhKk1jV+6eVd8ZpxglQAwPZKVYXeUsGfsUYx2k7J5mf56ZZdXZtG/whEH7CivIfXn
	d743/CKwJxbV7OPmLrBd+YZzvvdPHtH7SPnh7o3g+inXp6Y5UJjFdYt43CV01X+HZs3IUYCylTg
	Xo3FZRFnRs04jbS2qIcDOOpvttV4SfdlWZ5SBZMCqHXoTFp0NVaJL7/4Acz3nqnve9k3bIevip/
	llZdl4rt0laNar1xGpkZBrUZf4+Sm/rujZ4I=
X-Received: by 2002:ad4:5c89:0:b0:908:3e1c:647f with SMTP id 6a1803df08f44-90c8fa9093emr222737306d6.32.1787584953867;
        Mon, 24 Aug 2026 08:22:33 -0700 (PDT)
X-Received: by 2002:ad4:5c89:0:b0:908:3e1c:647f with SMTP id 6a1803df08f44-90c8fa9093emr222736316d6.32.1787584953292;
        Mon, 24 Aug 2026 08:22:33 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93619bbcsm64952496d6.20.2026.08.24.08.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:22:32 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:22:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ulf Hansson <ulfh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michal Simek <michal.simek@amd.com>,
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] mmc: meson-gx: FIXME: Make sure clk_init_data is
 fully initialized
Message-ID: <aoxhtzBk0SH7D8hQ@redhat.com>
References: <cover.1787240090.git.geert+renesas@glider.be>
 <4b9a377a810b69a4eb885fc00cb34ef63e7fc1f1.1787240090.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <4b9a377a810b69a4eb885fc00cb34ef63e7fc1f1.1787240090.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1bff51tgzWRcX4Ms_ymWBgNoZ-p7VacWfI8hVXsZy2w_1787584954
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_082237_055540_BA8A41DC 
X-CRM114-Status: GOOD (  12.27  )
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

On Fri, Aug 21, 2026 at 12:06:03PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

It looks like the FIXME should be dropped in the commit title? With that
dropped:

Reviewed-by: Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
