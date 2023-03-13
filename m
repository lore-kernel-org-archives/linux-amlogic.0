Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F5FC6FD19
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 04:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=CjZfFr2JBVwmuVnndaGUpu5vY15JL0yefFwoWXDy6H0=; b=UAanTPMMNCXVIE
	Gao1BWUUGYJfmxk2k32QFZkv6bZ+mfyh9I4K6QO93r4AB+dSRcOuuC9T6JO37E1kqZir975Pyy3K6
	R5Oxso8FktmhMgQLP1gPXOpA1rVsorDWrRebxnL+f8tqMeSgdzZgCZyHAjLZulAmdDhMJ99WjaBT+
	xsWufOaCGrRKGgVutMvhNwhUVBrCJeEKFZfBmxOe11mTohderMD5OjQHhkHel+F+2eppTnS2ZyBY9
	R9jDhkUOZ1eJs6FAcMKJWMlXn34xHvpXaejUitVtdwwNktBBEgCt3wTccdeXsjU38O9hRTTxnALnI
	2n11VPUXLAQ75h0cVedA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbZva-004JYe-4n; Mon, 13 Mar 2023 04:36:54 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbZvV-004JXN-JU; Mon, 13 Mar 2023 04:36:51 +0000
Received: by mail-wm1-x332.google.com with SMTP id k25-20020a7bc419000000b003ed23114fa7so1279127wmi.4;
        Sun, 12 Mar 2023 21:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678682203;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RPkjKDsBb71nKpudtxtcqtlqrtUYMaoaA2+YW5pgk20=;
        b=o8UFDtry4uG1JbWAltEud3mIbYrFjovuA16M/p1MxxmdZzNiBEhexzUGojCZBwEFlp
         fJcPjpPXs4mQeTB5Yr+z85ztvyu4LL3T8+KrUqp5t5GDqI910fvVlZ878MJuAH2qCKKf
         NCeklxFow7mAXbMUVIRT0gH1UY0HjcyZnRehs6Q+NCloAR4y5fSOZL/H4dLqf13/Mmc4
         XLlfwl6mgJSvFVcLtRvQzrQqbC8IAB8qBDGwoaye5gbsF8iS8wSeMETb31PfD17oiI03
         6TxCm900m+1G5hzyf28lu2ozkICGb0eUnEPUZH8s+qNCB0M2Tqz3AZJzl9Y/ZC6+Pc2P
         WIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678682203;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPkjKDsBb71nKpudtxtcqtlqrtUYMaoaA2+YW5pgk20=;
        b=nUrU+ohVuKWjHjinDrHVaoir8b7DP5tmbNiEoz1Lmh0YaT3C03IFJsMSNyfk3v0tI0
         txHDy2PEYEbnJBq4cbDP0DjpimJEUTKAhBx18v+8mChbITLGIyOL/Bagp8THD3rI0Fz7
         MykYc7OO4dmO+zJAYtbtg4DNSktm671n29+MlcQfdUlQDioe0CoHCglaNyeKCxGroXeu
         1CQ1LlP67dxikXMbdheU6cEyL6zHRbL8epjjm+C9pHkNmkDz4UT/LoeXgWZoU591Pktx
         OGiO+RZEEtiGjrZRZAmVhIfs+7dK9avjhKp6Or54Q6tXPZUaWgCLexqnUss7zK3qopIk
         RZlA==
X-Gm-Message-State: AO0yUKU7UsklK1NFIB3E9EPpDrU17y/IAQlWFV0WIrB4x9DwbXnzA1RB
	gYnPL77srIjc6UrNFgR2zFo=
X-Google-Smtp-Source: AK7set+92T7zGiAWcx1G/zea8syZ/x/ZAOEQVX1oETWHiO4OPz7n5Ubnyu927iW/B/MnO5SdkvhlxQ==
X-Received: by 2002:a05:600c:4751:b0:3ea:f0d6:5d36 with SMTP id w17-20020a05600c475100b003eaf0d65d36mr9722929wmo.29.1678682202670;
        Sun, 12 Mar 2023 21:36:42 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l26-20020a1c791a000000b003eb68bb61c8sm7659421wme.3.2023.03.12.21.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 21:36:42 -0700 (PDT)
Date: Mon, 13 Mar 2023 07:36:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Christian Hewitt <christianshewitt@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: meson: vdec: add HEVC decode codec
Message-ID: <84114d96-87ac-4fc1-842d-aefb1da49914@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124034058.3407235-3-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_213649_648845_3FEA16EF 
X-CRM114-Status: UNSURE (   6.79  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, lkp@intel.com, Benjamin Roszak <benjamin545@gmail.com>, oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Christian,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Hewitt/media-meson-vdec-implement-10bit-bitstream-handling/20230124-114201
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230124034058.3407235-3-christianshewitt%40gmail.com
patch subject: [PATCH v2 2/2] media: meson: vdec: add HEVC decode codec
config: s390-randconfig-m031-20230310 (https://download.01.org/0day-ci/archive/20230312/202303120441.YFGHDOya-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303120441.YFGHDOya-lkp@intel.com/

smatch warnings:
drivers/staging/media/meson/vdec/codec_hevc.c:734 codec_hevc_prepare_new_frame() warn: possible memory leak of 'new_frame'

vim +/new_frame +734 drivers/staging/media/meson/vdec/codec_hevc.c

015f7814a5a991 Maxime Jourdan 2023-01-24  718  static struct hevc_frame *
015f7814a5a991 Maxime Jourdan 2023-01-24  719  codec_hevc_prepare_new_frame(struct amvdec_session *sess)
015f7814a5a991 Maxime Jourdan 2023-01-24  720  {
015f7814a5a991 Maxime Jourdan 2023-01-24  721  	struct amvdec_core *core = sess->core;
015f7814a5a991 Maxime Jourdan 2023-01-24  722  	struct hevc_frame *new_frame = NULL;
015f7814a5a991 Maxime Jourdan 2023-01-24  723  	struct codec_hevc *hevc = sess->priv;
015f7814a5a991 Maxime Jourdan 2023-01-24  724  	struct vb2_v4l2_buffer *vbuf;
015f7814a5a991 Maxime Jourdan 2023-01-24  725  	union rpm_param *params = &hevc->rpm_param;
015f7814a5a991 Maxime Jourdan 2023-01-24  726  
015f7814a5a991 Maxime Jourdan 2023-01-24  727  	new_frame = kzalloc(sizeof(*new_frame), GFP_KERNEL);
015f7814a5a991 Maxime Jourdan 2023-01-24  728  	if (!new_frame)
015f7814a5a991 Maxime Jourdan 2023-01-24  729  		return NULL;
015f7814a5a991 Maxime Jourdan 2023-01-24  730  
015f7814a5a991 Maxime Jourdan 2023-01-24  731  	vbuf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx);
015f7814a5a991 Maxime Jourdan 2023-01-24  732  	if (!vbuf) {
015f7814a5a991 Maxime Jourdan 2023-01-24  733  		dev_err(sess->core->dev, "No dst buffer available\n");
015f7814a5a991 Maxime Jourdan 2023-01-24 @734  		return NULL;

kfree(new_frame);

015f7814a5a991 Maxime Jourdan 2023-01-24  735  	}
015f7814a5a991 Maxime Jourdan 2023-01-24  736  
015f7814a5a991 Maxime Jourdan 2023-01-24  737  	new_frame->vbuf = vbuf;
015f7814a5a991 Maxime Jourdan 2023-01-24  738  	new_frame->referenced = 1;
015f7814a5a991 Maxime Jourdan 2023-01-24  739  	new_frame->show = 1;
015f7814a5a991 Maxime Jourdan 2023-01-24  740  	new_frame->poc = hevc->curr_poc;
015f7814a5a991 Maxime Jourdan 2023-01-24  741  	new_frame->cur_slice_type = params->p.slice_type;
015f7814a5a991 Maxime Jourdan 2023-01-24  742  	new_frame->num_reorder_pic = params->p.sps_num_reorder_pics_0;
015f7814a5a991 Maxime Jourdan 2023-01-24  743  	new_frame->offset = amvdec_read_dos(core, HEVC_SHIFT_BYTE_COUNT);
015f7814a5a991 Maxime Jourdan 2023-01-24  744  
015f7814a5a991 Maxime Jourdan 2023-01-24  745  	list_add_tail(&new_frame->list, &hevc->ref_frames_list);
015f7814a5a991 Maxime Jourdan 2023-01-24  746  	hevc->frames_num++;
015f7814a5a991 Maxime Jourdan 2023-01-24  747  
015f7814a5a991 Maxime Jourdan 2023-01-24  748  	return new_frame;
015f7814a5a991 Maxime Jourdan 2023-01-24  749  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
