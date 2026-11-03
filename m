Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DD1606D80F
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 13:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PoxdRA94;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XfYgo7Tu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+IpeTeek7HqfXEw00ajnd9Rdq0ZBBc4RgggJ+bADEsg=; b=PoxdRA94kPFsKkTELwir4OOmve
	62A6lZQz/gdoG38HGJ72xYuO5zUhnKWJC6u3Br7VbUqex7Ja2qoUzKv0Dyoa+zOhea77TTX3Zj93z
	wTeru1DXKfJAjabP2D3zY39Eh0fTxEt2hqG+YYImXbZM2tTbLKyOZnc2NZWmrJ9Eb5qZ4NlwmDV38
	JWaerrV+edpX/BsWNu9GILQax/NmYJsL+Nxpx7GczClJil4+/Egddye8S+psP/LG7IQkfvJUsiqHK
	tNys/SV3uPL+ZzncwByYPD71Dlg3DiWzNbS23BDIb8Y0CCA0OZvIRj6HrxSgVMSTMYgbntGT3JlhO
	AItU/egw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEvX-00000002dzw-0KMJ;
	Tue, 03 Nov 2026 13:51:51 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEvR-00000002dwx-1n0r
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 13:51:49 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1b1ce85287aso2128764c88.0
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 05:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713904; x=1794318704; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eZFocSGQWUyjjZwOU15rPwT7Iy8HDoBofRSNVrSiUk4=;
        b=XfYgo7TuUjuerGJRgAiWKRa+D8ewpksZex3loufkyu4mw7RJiRcgO0I2berFZO5QVG
         WO9d3CYtp7oeNuHZCn/js+Z6nzRJoianh319YPNBP5kQ3OzZM9NzLob8H6tth2m30UjD
         AiTHRYiSBE5kTGXmtyVgN3gTDK+AD1KcMbCbSGA7I/+QIhnWuq/rmRgyf1xar9fYHZcK
         t2UZ3yPvmk88dkqJv5cApzC4TANPRf+GSb5YitKumB7AFQAdiX0QQqohF3x3KHcDrEhq
         ghzzRUW0LBpP6hdkkH2qyBfud6Nw27Dcs39lvY4+jSA9vvFQBek6QNGb1OJu6460HO/e
         2imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713904; x=1794318704;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZFocSGQWUyjjZwOU15rPwT7Iy8HDoBofRSNVrSiUk4=;
        b=Ax8yRKnYz1q5PS3pbR07pKEeFJXVcEeileOG8d/bEr+05MkoipIRwxCLW6+o2d7FXC
         znpnRxCRCN1HOsiemjGRg6GkXCSDA0ymHuU94fxnDRr1tBhuM5XFNssYDbXVyaSycNvQ
         0LhrXzfqzUT+VpX1rpCmyCcMWimSGEmzmfkUgpVUlRXtxcAP782Vr8Lp0UABK7629HGN
         kCZTuFPm62r1146eDOt4o46hfiq3EbpNrBFBjM/81zdHQOcbOATaNNKZ/4aGp+pxk2Pg
         Wv+s5aEqgEYOvHNhfo/SgBEwdziMq7UUr34oqV/VxF+xM/tzxjy1l7zwmOOVAjnzSrv/
         rzfA==
X-Forwarded-Encrypted: i=1; AKwUvByXVMZhKjf1AaB58fJpZKf06/oQeDlAKFboZxnfZfpcqvjyr4Khz7/agOq3ebLm04dSRdC75s92+wTGofIn@lists.infradead.org
X-Gm-Message-State: APuU4Z8vTUBCM89p2759MNzfpfdstrazm8AaWsCaFJhNUzYhs3yWT4wb
	hfzaLY1Xrf0wZC39/r/747Ok1nPlfpTnZf4xgqE+MbNZG74qUaoWmuU8
X-Gm-Gg: AYBFou08+fuAKFEnH6HlTM8WAFahuRE5GrZ+mv0vNPOq+d8pMQA/6jaF5o/HshFxp2n
	ItxDUsPeH5PV4X1yiDes/RfTOy+nHkAAEWZJVTr9JiyPqtU49Q2Yef7WVFYhLBKfAzMqvVLqSr7
	ee6QsIZotK1aBrRUAcp4lvkNfn0r1e46N5tHbHl00WkZySUoNOtziLw8jC5lAfzvMQpyDAP/u9l
	oP9aEw+x7kyH6fcL6cO2cT3iAZ3xFt1jgA9HVcNrXDrKHeYYTZRZ0/M1wndXOb8EtnxPIIHuCX4
	+GHtCKAYEuMsRiyJlPDJ3bZP048zS0yOxA9uJLtL3rJHNYKu6QHwjOUQsKpKcLLBmGSsLfCdWQH
	gBik0aCP2dLlu23Ry1iF3QoUG4flI+UYpNf3OZ39INJ2uhoU6Y1Q51ZWIb1dutI1HsP/j0unUBT
	9aQ4In/VYD3dRpTRzUfP/Beup92oBZaPT+sJnhPEH2PYDoJOwaS5NWELPd+zJFiRT7p6ajAIhEA
	KHxwHMEXFEo/aymLbczH5QI1OH6Vp6WjuxGob3UjlMYCci65lO7cvNZqx+F+y21ji2505fKO+cI
	3pjLFHKI9ZB/camLlg52+lT/9mHaicBpmoU6OFpOYBigzkERls0I+mvr0FFAC7Pxtg==
X-Received: by 2002:a05:7022:4392:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1ac5de53bc8mr32355285c88.29.1793713904238;
        Tue, 03 Nov 2026 05:51:44 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm46918499c88.12.2026.11.03.05.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:43 -0800 (PST)
From: joonhoekim <26rote@gmail.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	dragon@radxa.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 09/20] drm/msm/dp: Unwind resources when enabling a stream fails
Date: Tue,  3 Nov 2026 22:51:40 +0900
Message-ID: <20261103135141.1993-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261009-msm-dp-hdr10-v2-9-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com> <20261009-msm-dp-hdr10-v2-9-1835d4966da3@radxa.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_055147_002245_ACF2C086 
X-CRM114-Status: GOOD (  13.34  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Joonhoe Kim <26rote@gmail.com>

On Fri, 09 Oct 2026 11:16:01 +0800, Xilin Wu wrote:
> Stream enable can fail after acquiring a runtime PM reference or
> starting the link. Returning directly leaks those resources, while a
> later disable can release a reference that was never acquired.

This leak breaks USB on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali). I
tried parts of 08/20 and this patch as a fix for it. The result was
worse.

The sequence, seen with kprobes on v7.3 with out-of-tree board
support:

- A USB-C monitor is unplugged during s2idle. On resume, the stream
  enable trains the link to the gone sink and fails. Nothing releases
  the DP PHY init taken for it.

- At the next suspend entry (booted with no_console_suspend, so fbcon
  restores the old mode), an enable on the disconnected connector
  powers the DP PHY on, and msm_dp_ctrl_enable_mainlink_clocks() fails
  with -EBUSY. The PHY power is not released either.

- The DP side now holds the QMP combo PHY. On the next resume,
  qmp_combo_usb_init() skips the common block init, and
  qmp_combo_usb_power_on() times out waiting for PHYSTATUS. The dwc3
  resume fails with -110, and USB stays down until reboot.

On top of v7.3 I applied only the PHY power tracking from 08/20, the
power-off on the link clock failure from this patch, and a backport of
1bda647ce61b ("drm/msm/dp: move link-level teardown from
display_disable to display_unprepare") from msm-next. Then the same
unplug during s2idle crashed the SoC:

  [drm:msm_dp_ctrl_link_train_1_2] *ERROR* link training #1 on phy 0 failed. ret=-110
  ...
  [drm:msm_dp_display_atomic_enable] *ERROR* DP display prepare failed, rc=-104
  [drm:dpu_encoder_phys_vid_wait_for_commit_done:583] [dpu error]vblank timeout: a0820302
  [drm:dpu_encoder_phys_vid_disable] *ERROR* wait disable failed: id:37 intf:0 ret:-110

The device then reset into its crash dump mode. It crashed the same way
once more, after a failed link training during repeated VT switches
with the monitor attached. There the log went on 10 ms later with:

  qcom_q6v5_pas d00000.remoteproc: fatal error received: sys_m_smsm.c:503:TZ force stop

Without these changes I saw the same failed enable and "wait disable
failed" three times, with no crash.

My guess is that the DP PHY, which clocks the DPU video interface, is
now turned off while that interface is still enabled. I have not
confirmed it. So I can't give a Tested-by. The PHY leak is still open
here.

Thanks,
Joonhoe Kim

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
