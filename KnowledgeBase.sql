PGDMP                      }            KnowledgeBase    17.4    17.4 p    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16750    KnowledgeBase    DATABASE     u   CREATE DATABASE "KnowledgeBase" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-US';
    DROP DATABASE "KnowledgeBase";
                     postgres    false            �            1259    16978    assessment_attempts    TABLE     N  CREATE TABLE public.assessment_attempts (
    attempt_id integer NOT NULL,
    candidate_id integer NOT NULL,
    job_id integer NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone,
    status character varying(20) DEFAULT 'started'::character varying,
    performance_log jsonb
);
 '   DROP TABLE public.assessment_attempts;
       public         heap r       postgres    false            �            1259    16977 "   assessment_attempts_attempt_id_seq    SEQUENCE     �   CREATE SEQUENCE public.assessment_attempts_attempt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.assessment_attempts_attempt_id_seq;
       public               postgres    false    241            �           0    0 "   assessment_attempts_attempt_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.assessment_attempts_attempt_id_seq OWNED BY public.assessment_attempts.attempt_id;
          public               postgres    false    240            �            1259    16751    candidate_rankings    TABLE     �   CREATE TABLE public.candidate_rankings (
    candidate_id integer NOT NULL,
    job_id integer NOT NULL,
    match_score double precision NOT NULL
);
 &   DROP TABLE public.candidate_rankings;
       public         heap r       postgres    false            �            1259    16754    candidate_skills    TABLE     �   CREATE TABLE public.candidate_skills (
    candidate_id integer NOT NULL,
    skill_id integer NOT NULL,
    proficiency integer,
    CONSTRAINT candidate_skills_proficiency_check CHECK (((proficiency >= 1) AND (proficiency <= 10)))
);
 $   DROP TABLE public.candidate_skills;
       public         heap r       postgres    false            �            1259    16758 
   candidates    TABLE     4  CREATE TABLE public.candidates (
    candidate_id integer NOT NULL,
    unique_id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(20),
    location character varying(255),
    linkedin character varying(255),
    github character varying(255),
    degree character varying(100),
    years_of_experience double precision,
    resume character varying(255),
    profile_picture character varying(255),
    is_profile_complete boolean DEFAULT false NOT NULL
);
    DROP TABLE public.candidates;
       public         heap r       postgres    false            �            1259    16764    candidates_candidate_id_seq    SEQUENCE     �   CREATE SEQUENCE public.candidates_candidate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.candidates_candidate_id_seq;
       public               postgres    false    219            �           0    0    candidates_candidate_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.candidates_candidate_id_seq OWNED BY public.candidates.candidate_id;
          public               postgres    false    220            �            1259    16765 	   education    TABLE     r  CREATE TABLE public.education (
    education_id integer NOT NULL,
    candidate_id integer,
    degree character varying(255) NOT NULL,
    institution character varying(255) NOT NULL,
    graduation_year integer,
    certification boolean DEFAULT false,
    CONSTRAINT education_graduation_year_check CHECK (((graduation_year > 1900) AND (graduation_year < 2100)))
);
    DROP TABLE public.education;
       public         heap r       postgres    false            �            1259    16772    education_education_id_seq    SEQUENCE     �   CREATE SEQUENCE public.education_education_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.education_education_id_seq;
       public               postgres    false    221            �           0    0    education_education_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.education_education_id_seq OWNED BY public.education.education_id;
          public               postgres    false    222            �            1259    16773    job_descriptions    TABLE     y  CREATE TABLE public.job_descriptions (
    job_id integer NOT NULL,
    job_title character varying(255) NOT NULL,
    company character varying(255) NOT NULL,
    location character varying(255),
    degree_required character varying(255),
    description text,
    recruiter_id integer NOT NULL,
    duration integer NOT NULL,
    num_questions integer NOT NULL,
    schedule timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    experience_min integer NOT NULL,
    experience_max integer NOT NULL,
    CONSTRAINT job_descriptions_check CHECK ((experience_max >= experience_min)),
    CONSTRAINT job_descriptions_duration_check CHECK ((duration > 0)),
    CONSTRAINT job_descriptions_experience_min_check CHECK ((experience_min >= 0)),
    CONSTRAINT job_descriptions_num_questions_check CHECK ((num_questions > 0))
);
 $   DROP TABLE public.job_descriptions;
       public         heap r       postgres    false            �            1259    16779    job_descriptions_job_id_seq    SEQUENCE     �   CREATE SEQUENCE public.job_descriptions_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.job_descriptions_job_id_seq;
       public               postgres    false    223            �           0    0    job_descriptions_job_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.job_descriptions_job_id_seq OWNED BY public.job_descriptions.job_id;
          public               postgres    false    224            �            1259    16780    knowledge_base    TABLE     |   CREATE TABLE public.knowledge_base (
    job_title character varying(255) NOT NULL,
    recommended_skills text NOT NULL
);
 "   DROP TABLE public.knowledge_base;
       public         heap r       postgres    false            �            1259    16957    mcqs    TABLE     h  CREATE TABLE public.mcqs (
    mcq_id integer NOT NULL,
    job_id integer NOT NULL,
    skill_id integer NOT NULL,
    question text NOT NULL,
    option_a text NOT NULL,
    option_b text NOT NULL,
    option_c text NOT NULL,
    option_d text NOT NULL,
    correct_answer character varying(1) NOT NULL,
    difficulty_band character varying(20) NOT NULL
);
    DROP TABLE public.mcqs;
       public         heap r       postgres    false            �            1259    16956    mcqs_mcq_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mcqs_mcq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.mcqs_mcq_id_seq;
       public               postgres    false    239            �           0    0    mcqs_mcq_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.mcqs_mcq_id_seq OWNED BY public.mcqs.mcq_id;
          public               postgres    false    238            �            1259    16791    projects    TABLE     �   CREATE TABLE public.projects (
    project_id integer NOT NULL,
    candidate_id integer,
    title character varying(255) NOT NULL,
    technologies text NOT NULL,
    description text
);
    DROP TABLE public.projects;
       public         heap r       postgres    false            �            1259    16796    projects_project_id_seq    SEQUENCE     �   CREATE SEQUENCE public.projects_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.projects_project_id_seq;
       public               postgres    false    226            �           0    0    projects_project_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.projects_project_id_seq OWNED BY public.projects.project_id;
          public               postgres    false    227            �            1259    16797    publications    TABLE     �   CREATE TABLE public.publications (
    publication_id integer NOT NULL,
    candidate_id integer,
    title character varying(255) NOT NULL,
    link character varying(255)
);
     DROP TABLE public.publications;
       public         heap r       postgres    false            �            1259    16802    publications_publication_id_seq    SEQUENCE     �   CREATE SEQUENCE public.publications_publication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.publications_publication_id_seq;
       public               postgres    false    228            �           0    0    publications_publication_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.publications_publication_id_seq OWNED BY public.publications.publication_id;
          public               postgres    false    229            �            1259    16803    required_skills    TABLE     �   CREATE TABLE public.required_skills (
    job_id integer NOT NULL,
    skill_id integer NOT NULL,
    priority integer,
    CONSTRAINT required_skills_priority_check CHECK (((priority >= 1) AND (priority <= 5)))
);
 #   DROP TABLE public.required_skills;
       public         heap r       postgres    false            �            1259    16807    resume_json    TABLE     ]   CREATE TABLE public.resume_json (
    candidate_id integer,
    raw_resume jsonb NOT NULL
);
    DROP TABLE public.resume_json;
       public         heap r       postgres    false            �            1259    16812    skills    TABLE     �   CREATE TABLE public.skills (
    skill_id integer NOT NULL,
    name character varying(255) NOT NULL,
    category character varying(255)
);
    DROP TABLE public.skills;
       public         heap r       postgres    false            �            1259    16817    skills_skill_id_seq    SEQUENCE     �   CREATE SEQUENCE public.skills_skill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.skills_skill_id_seq;
       public               postgres    false    232            �           0    0    skills_skill_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.skills_skill_id_seq OWNED BY public.skills.skill_id;
          public               postgres    false    233            �            1259    16931    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100),
    email character varying(120) NOT NULL,
    password_hash character varying(200),
    role character varying(20)
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    16930    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public               postgres    false    237            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public               postgres    false    236            �            1259    16818    work_experience    TABLE     	  CREATE TABLE public.work_experience (
    experience_id integer NOT NULL,
    candidate_id integer,
    job_title character varying(255) NOT NULL,
    company character varying(255) NOT NULL,
    start_date date NOT NULL,
    end_date date,
    description text
);
 #   DROP TABLE public.work_experience;
       public         heap r       postgres    false            �            1259    16823 !   work_experience_experience_id_seq    SEQUENCE     �   CREATE SEQUENCE public.work_experience_experience_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.work_experience_experience_id_seq;
       public               postgres    false    234            �           0    0 !   work_experience_experience_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.work_experience_experience_id_seq OWNED BY public.work_experience.experience_id;
          public               postgres    false    235            �           2604    16981    assessment_attempts attempt_id    DEFAULT     �   ALTER TABLE ONLY public.assessment_attempts ALTER COLUMN attempt_id SET DEFAULT nextval('public.assessment_attempts_attempt_id_seq'::regclass);
 M   ALTER TABLE public.assessment_attempts ALTER COLUMN attempt_id DROP DEFAULT;
       public               postgres    false    240    241    241            �           2604    16824    candidates candidate_id    DEFAULT     �   ALTER TABLE ONLY public.candidates ALTER COLUMN candidate_id SET DEFAULT nextval('public.candidates_candidate_id_seq'::regclass);
 F   ALTER TABLE public.candidates ALTER COLUMN candidate_id DROP DEFAULT;
       public               postgres    false    220    219            �           2604    16825    education education_id    DEFAULT     �   ALTER TABLE ONLY public.education ALTER COLUMN education_id SET DEFAULT nextval('public.education_education_id_seq'::regclass);
 E   ALTER TABLE public.education ALTER COLUMN education_id DROP DEFAULT;
       public               postgres    false    222    221            �           2604    16826    job_descriptions job_id    DEFAULT     �   ALTER TABLE ONLY public.job_descriptions ALTER COLUMN job_id SET DEFAULT nextval('public.job_descriptions_job_id_seq'::regclass);
 F   ALTER TABLE public.job_descriptions ALTER COLUMN job_id DROP DEFAULT;
       public               postgres    false    224    223            �           2604    16960    mcqs mcq_id    DEFAULT     j   ALTER TABLE ONLY public.mcqs ALTER COLUMN mcq_id SET DEFAULT nextval('public.mcqs_mcq_id_seq'::regclass);
 :   ALTER TABLE public.mcqs ALTER COLUMN mcq_id DROP DEFAULT;
       public               postgres    false    238    239    239            �           2604    16828    projects project_id    DEFAULT     z   ALTER TABLE ONLY public.projects ALTER COLUMN project_id SET DEFAULT nextval('public.projects_project_id_seq'::regclass);
 B   ALTER TABLE public.projects ALTER COLUMN project_id DROP DEFAULT;
       public               postgres    false    227    226            �           2604    16829    publications publication_id    DEFAULT     �   ALTER TABLE ONLY public.publications ALTER COLUMN publication_id SET DEFAULT nextval('public.publications_publication_id_seq'::regclass);
 J   ALTER TABLE public.publications ALTER COLUMN publication_id DROP DEFAULT;
       public               postgres    false    229    228            �           2604    16830    skills skill_id    DEFAULT     r   ALTER TABLE ONLY public.skills ALTER COLUMN skill_id SET DEFAULT nextval('public.skills_skill_id_seq'::regclass);
 >   ALTER TABLE public.skills ALTER COLUMN skill_id DROP DEFAULT;
       public               postgres    false    233    232            �           2604    16934    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    236    237    237            �           2604    16831    work_experience experience_id    DEFAULT     �   ALTER TABLE ONLY public.work_experience ALTER COLUMN experience_id SET DEFAULT nextval('public.work_experience_experience_id_seq'::regclass);
 L   ALTER TABLE public.work_experience ALTER COLUMN experience_id DROP DEFAULT;
       public               postgres    false    235    234            �          0    16978    assessment_attempts 
   TABLE DATA           ~   COPY public.assessment_attempts (attempt_id, candidate_id, job_id, start_time, end_time, status, performance_log) FROM stdin;
    public               postgres    false    241   ��       {          0    16751    candidate_rankings 
   TABLE DATA           O   COPY public.candidate_rankings (candidate_id, job_id, match_score) FROM stdin;
    public               postgres    false    217   �       |          0    16754    candidate_skills 
   TABLE DATA           O   COPY public.candidate_skills (candidate_id, skill_id, proficiency) FROM stdin;
    public               postgres    false    218   7�       }          0    16758 
   candidates 
   TABLE DATA           �   COPY public.candidates (candidate_id, unique_id, name, email, phone, location, linkedin, github, degree, years_of_experience, resume, profile_picture, is_profile_complete) FROM stdin;
    public               postgres    false    219   T�                 0    16765 	   education 
   TABLE DATA           t   COPY public.education (education_id, candidate_id, degree, institution, graduation_year, certification) FROM stdin;
    public               postgres    false    221   -�       �          0    16773    job_descriptions 
   TABLE DATA           �   COPY public.job_descriptions (job_id, job_title, company, location, degree_required, description, recruiter_id, duration, num_questions, schedule, created_at, experience_min, experience_max) FROM stdin;
    public               postgres    false    223   ė       �          0    16780    knowledge_base 
   TABLE DATA           G   COPY public.knowledge_base (job_title, recommended_skills) FROM stdin;
    public               postgres    false    225   ٘       �          0    16957    mcqs 
   TABLE DATA           �   COPY public.mcqs (mcq_id, job_id, skill_id, question, option_a, option_b, option_c, option_d, correct_answer, difficulty_band) FROM stdin;
    public               postgres    false    239   ��       �          0    16791    projects 
   TABLE DATA           ^   COPY public.projects (project_id, candidate_id, title, technologies, description) FROM stdin;
    public               postgres    false    226   �       �          0    16797    publications 
   TABLE DATA           Q   COPY public.publications (publication_id, candidate_id, title, link) FROM stdin;
    public               postgres    false    228   �       �          0    16803    required_skills 
   TABLE DATA           E   COPY public.required_skills (job_id, skill_id, priority) FROM stdin;
    public               postgres    false    230   <�       �          0    16807    resume_json 
   TABLE DATA           ?   COPY public.resume_json (candidate_id, raw_resume) FROM stdin;
    public               postgres    false    231   m�       �          0    16812    skills 
   TABLE DATA           :   COPY public.skills (skill_id, name, category) FROM stdin;
    public               postgres    false    232   ��       �          0    16931    users 
   TABLE DATA           E   COPY public.users (id, name, email, password_hash, role) FROM stdin;
    public               postgres    false    237   ��       �          0    16818    work_experience 
   TABLE DATA           }   COPY public.work_experience (experience_id, candidate_id, job_title, company, start_date, end_date, description) FROM stdin;
    public               postgres    false    234   
�       �           0    0 "   assessment_attempts_attempt_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.assessment_attempts_attempt_id_seq', 1, false);
          public               postgres    false    240            �           0    0    candidates_candidate_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.candidates_candidate_id_seq', 4, true);
          public               postgres    false    220            �           0    0    education_education_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.education_education_id_seq', 10, true);
          public               postgres    false    222            �           0    0    job_descriptions_job_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.job_descriptions_job_id_seq', 20, true);
          public               postgres    false    224            �           0    0    mcqs_mcq_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.mcqs_mcq_id_seq', 62, true);
          public               postgres    false    238            �           0    0    projects_project_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.projects_project_id_seq', 1, false);
          public               postgres    false    227            �           0    0    publications_publication_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.publications_publication_id_seq', 1, false);
          public               postgres    false    229            �           0    0    skills_skill_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.skills_skill_id_seq', 64, true);
          public               postgres    false    233            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public               postgres    false    236            �           0    0 !   work_experience_experience_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.work_experience_experience_id_seq', 16, true);
          public               postgres    false    235            �           2606    16986 ,   assessment_attempts assessment_attempts_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.assessment_attempts
    ADD CONSTRAINT assessment_attempts_pkey PRIMARY KEY (attempt_id);
 V   ALTER TABLE ONLY public.assessment_attempts DROP CONSTRAINT assessment_attempts_pkey;
       public                 postgres    false    241            �           2606    16833 *   candidate_rankings candidate_rankings_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.candidate_rankings
    ADD CONSTRAINT candidate_rankings_pkey PRIMARY KEY (candidate_id, job_id);
 T   ALTER TABLE ONLY public.candidate_rankings DROP CONSTRAINT candidate_rankings_pkey;
       public                 postgres    false    217    217            �           2606    16835 &   candidate_skills candidate_skills_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.candidate_skills
    ADD CONSTRAINT candidate_skills_pkey PRIMARY KEY (candidate_id, skill_id);
 P   ALTER TABLE ONLY public.candidate_skills DROP CONSTRAINT candidate_skills_pkey;
       public                 postgres    false    218    218            �           2606    16837    candidates candidates_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT candidates_email_key UNIQUE (email);
 I   ALTER TABLE ONLY public.candidates DROP CONSTRAINT candidates_email_key;
       public                 postgres    false    219            �           2606    16839     candidates candidates_github_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT candidates_github_key UNIQUE (github);
 J   ALTER TABLE ONLY public.candidates DROP CONSTRAINT candidates_github_key;
       public                 postgres    false    219            �           2606    16841 "   candidates candidates_linkedin_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT candidates_linkedin_key UNIQUE (linkedin);
 L   ALTER TABLE ONLY public.candidates DROP CONSTRAINT candidates_linkedin_key;
       public                 postgres    false    219            �           2606    16843    candidates candidates_phone_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT candidates_phone_key UNIQUE (phone);
 I   ALTER TABLE ONLY public.candidates DROP CONSTRAINT candidates_phone_key;
       public                 postgres    false    219            �           2606    16845    candidates candidates_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT candidates_pkey PRIMARY KEY (candidate_id);
 D   ALTER TABLE ONLY public.candidates DROP CONSTRAINT candidates_pkey;
       public                 postgres    false    219            �           2606    16847 #   candidates candidates_unique_id_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT candidates_unique_id_key UNIQUE (unique_id);
 M   ALTER TABLE ONLY public.candidates DROP CONSTRAINT candidates_unique_id_key;
       public                 postgres    false    219            �           2606    16849    education education_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.education
    ADD CONSTRAINT education_pkey PRIMARY KEY (education_id);
 B   ALTER TABLE ONLY public.education DROP CONSTRAINT education_pkey;
       public                 postgres    false    221            �           2606    16851 &   job_descriptions job_descriptions_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.job_descriptions
    ADD CONSTRAINT job_descriptions_pkey PRIMARY KEY (job_id);
 P   ALTER TABLE ONLY public.job_descriptions DROP CONSTRAINT job_descriptions_pkey;
       public                 postgres    false    223            �           2606    16853 "   knowledge_base knowledge_base_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.knowledge_base
    ADD CONSTRAINT knowledge_base_pkey PRIMARY KEY (job_title);
 L   ALTER TABLE ONLY public.knowledge_base DROP CONSTRAINT knowledge_base_pkey;
       public                 postgres    false    225            �           2606    16964    mcqs mcqs_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.mcqs
    ADD CONSTRAINT mcqs_pkey PRIMARY KEY (mcq_id);
 8   ALTER TABLE ONLY public.mcqs DROP CONSTRAINT mcqs_pkey;
       public                 postgres    false    239            �           2606    16857    projects projects_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (project_id);
 @   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
       public                 postgres    false    226            �           2606    16859 "   publications publications_link_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_link_key UNIQUE (link);
 L   ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_link_key;
       public                 postgres    false    228            �           2606    16861    publications publications_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_pkey PRIMARY KEY (publication_id);
 H   ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_pkey;
       public                 postgres    false    228            �           2606    16863 $   required_skills required_skills_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.required_skills
    ADD CONSTRAINT required_skills_pkey PRIMARY KEY (job_id, skill_id);
 N   ALTER TABLE ONLY public.required_skills DROP CONSTRAINT required_skills_pkey;
       public                 postgres    false    230    230            �           2606    16865    skills skills_name_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_name_key UNIQUE (name);
 @   ALTER TABLE ONLY public.skills DROP CONSTRAINT skills_name_key;
       public                 postgres    false    232            �           2606    16867    skills skills_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (skill_id);
 <   ALTER TABLE ONLY public.skills DROP CONSTRAINT skills_pkey;
       public                 postgres    false    232            �           2606    16938    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public                 postgres    false    237            �           2606    16936    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    237            �           2606    16869 $   work_experience work_experience_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.work_experience
    ADD CONSTRAINT work_experience_pkey PRIMARY KEY (experience_id);
 N   ALTER TABLE ONLY public.work_experience DROP CONSTRAINT work_experience_pkey;
       public                 postgres    false    234            �           2606    16987 9   assessment_attempts assessment_attempts_candidate_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.assessment_attempts
    ADD CONSTRAINT assessment_attempts_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES public.candidates(candidate_id);
 c   ALTER TABLE ONLY public.assessment_attempts DROP CONSTRAINT assessment_attempts_candidate_id_fkey;
       public               postgres    false    219    4795    241            �           2606    16992 3   assessment_attempts assessment_attempts_job_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.assessment_attempts
    ADD CONSTRAINT assessment_attempts_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.job_descriptions(job_id);
 ]   ALTER TABLE ONLY public.assessment_attempts DROP CONSTRAINT assessment_attempts_job_id_fkey;
       public               postgres    false    241    223    4801            �           2606    16870 7   candidate_rankings candidate_rankings_candidate_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidate_rankings
    ADD CONSTRAINT candidate_rankings_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES public.candidates(candidate_id) ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.candidate_rankings DROP CONSTRAINT candidate_rankings_candidate_id_fkey;
       public               postgres    false    4795    219    217            �           2606    16875 1   candidate_rankings candidate_rankings_job_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidate_rankings
    ADD CONSTRAINT candidate_rankings_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.job_descriptions(job_id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.candidate_rankings DROP CONSTRAINT candidate_rankings_job_id_fkey;
       public               postgres    false    217    4801    223            �           2606    16880 3   candidate_skills candidate_skills_candidate_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidate_skills
    ADD CONSTRAINT candidate_skills_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES public.candidates(candidate_id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.candidate_skills DROP CONSTRAINT candidate_skills_candidate_id_fkey;
       public               postgres    false    219    218    4795            �           2606    16885 /   candidate_skills candidate_skills_skill_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidate_skills
    ADD CONSTRAINT candidate_skills_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skills(skill_id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.candidate_skills DROP CONSTRAINT candidate_skills_skill_id_fkey;
       public               postgres    false    4815    232    218            �           2606    16890 %   education education_candidate_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.education
    ADD CONSTRAINT education_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES public.candidates(candidate_id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.education DROP CONSTRAINT education_candidate_id_fkey;
       public               postgres    false    219    4795    221            �           2606    16943 3   job_descriptions job_descriptions_recruiter_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_descriptions
    ADD CONSTRAINT job_descriptions_recruiter_id_fkey FOREIGN KEY (recruiter_id) REFERENCES public.users(id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.job_descriptions DROP CONSTRAINT job_descriptions_recruiter_id_fkey;
       public               postgres    false    237    4821    223            �           2606    16965    mcqs mcqs_job_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mcqs
    ADD CONSTRAINT mcqs_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.job_descriptions(job_id) ON DELETE CASCADE;
 ?   ALTER TABLE ONLY public.mcqs DROP CONSTRAINT mcqs_job_id_fkey;
       public               postgres    false    4801    239    223            �           2606    16970    mcqs mcqs_skill_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mcqs
    ADD CONSTRAINT mcqs_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skills(skill_id) ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.mcqs DROP CONSTRAINT mcqs_skill_id_fkey;
       public               postgres    false    232    4815    239            �           2606    16900 #   projects projects_candidate_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES public.candidates(candidate_id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_candidate_id_fkey;
       public               postgres    false    4795    219    226            �           2606    16905 +   publications publications_candidate_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES public.candidates(candidate_id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_candidate_id_fkey;
       public               postgres    false    4795    219    228            �           2606    16910 +   required_skills required_skills_job_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.required_skills
    ADD CONSTRAINT required_skills_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.job_descriptions(job_id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.required_skills DROP CONSTRAINT required_skills_job_id_fkey;
       public               postgres    false    230    4801    223            �           2606    16915 -   required_skills required_skills_skill_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.required_skills
    ADD CONSTRAINT required_skills_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skills(skill_id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.required_skills DROP CONSTRAINT required_skills_skill_id_fkey;
       public               postgres    false    232    4815    230            �           2606    16920 )   resume_json resume_json_candidate_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.resume_json
    ADD CONSTRAINT resume_json_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES public.candidates(candidate_id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.resume_json DROP CONSTRAINT resume_json_candidate_id_fkey;
       public               postgres    false    4795    231    219            �           2606    16925 1   work_experience work_experience_candidate_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.work_experience
    ADD CONSTRAINT work_experience_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES public.candidates(candidate_id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.work_experience DROP CONSTRAINT work_experience_candidate_id_fkey;
       public               postgres    false    219    234    4795            �      x������ � �      {      x������ � �      |      x������ � �      }   �   x�=��n�0Dח����0]U���T�]VB66�*�X1��oB��fq��4`u7
�r���ljN��pU+n�T���a����w�N�����D!�˴X��p^��4����O�)@\�\����ΘN�c��[%)���FK�8��4�7w����+}���ʶ���H��^��G�!_�#Ρ�8ܹ��'4�	��VU�{�N<         �   x�=ͱ
�0����79��t+T�\��㥤�з7:8|����Q���V��d#�e���S��7Yk�m�<�m������	fe�q�>|�l�8*;n�Tc�������I���K]��5�k�S+�>�.�      �     x����j�0��~�I�c[ǭ�l�1�a���I�KJZ���i7
m�~�"xMߩe�J�~�U����Ѩ�~��K��	�����6���vh�Z����=�<=vtBEN
�34�X
G�9�h��TB5��-���P5�n��!�$s6�b#/M/6�-u@��i�7�L
Y8\���X3[�t2ü������ur�v�J1���|r�;�cݮ���\�Q8OdM1Z�t.�v�&�33fΜ��x��.���ˁ�      �      x������ � �      �   �  x��Z�������+
I��8=�����F���/���ȕ�5
��Iq��wf��%�;]�0��9�o���,�^������x��8�TYǪ.�+Q���x񁧵`{.�j|/+���T�d�d����*xl�"y2o�Ɋ�L.e�X��%��(a�b�8S��"��V|��-Q�$�)/�ӛ,3}��W�s�*�ǦH��N�[ܔ38�L�?2U��\	hMacپ;�Wp�E�� sKv`2g%Ϸb8�}
�}ͣ`�׼
�Z�H��y�Rܱ�`Ǣf<�E����˫��%�-Վz@�l��Lp]�'q�4�����3��yZd���`eB\���\�_�A�:#�L�]�T�y��d!	J�'	���L�
[p���`��"�y%J5|��.|H�8(��'}��[��`�U*c�ު���^�"�G{ʢ�[���@�)���ˡ�XB�������D�v'?��HQ�.�Z٧<V�O�(�˵�YU-Q�h0��i��,b{�:���Q���A�31���������v�ڑk��'-�ۂU����*ly\��?�~�e�>=���ѓ�f�s8� �Nծe�1W+�������m�}3��љ����F��Y�Ax-K�{�
���l�&v��ߴ+?TH�������W��EXR{g�F
V8%�
~�)(/W �L�N�(��в:U��2ܔE�mꜤ��Ny�XȊ:WI
\E��M�׾��P�80�na��e�u���tZD�x'��L�g"��H����"����Q; (z��7뙃��^�q,�՘��m@-���9j;l��4EI���j_+@a$WCu܋�p2�F�"�&N:� ;�ֽ���w�轁O�#�	6�EY��Z���F=��r�g�陪1Lc�	T�m_�]��b^"Zo�n	eG&_��P���c�@���,f��5{��7
����V��G��ꈘN]\"����]Y%6j�\������ֆ�>�\Pq.��e�.��4��P0�oQ �R|e��C��btO`_�� ���XL�+���$�.&�u�@d��H���T�~6����U�πN˕}�O1O?٧o���7�Ey ��<�1�N��E>B�"�<1m6ڂ�D^��p�����C ��G6CE�#N�8�&nw`C�f�x�EN7�b- #��.�P�Ъl�!�5�C�;�<A�	������ѩp|V��@�v�3���x!6�($�G���ިG�`�Uy�^I������S"���"�ﵨk����e �TRֲ4؏�u����f;����ۤC5�B����Xl}� >�=��y�CP��+�zHZ��Q�������jE��u0�(g<�AGW $(���B���v6D���J%���
T� r�@J�JRcE�u�!S��͂N�E~Wd�V䢨������{��X:�����P��p�'���9Mb*��@�y/ͥ3��| {�6Ă�l3@�d̦c6���]���
��ρ�X�J�G6]E�o_�����d�t�"4ˮ�S��z�w�ghK1.��\ƨ�LB��;��>X�������}z�4��y�V�� ���Q@�^!��Pٜ���J��1���C���ں��/(�5����c]�3nBsC��;3@J��{���/�9~Ή^��� f�}�W}�F4�t<����&��&�	��Z���:��S(qqX����I�-��	�������D;oL�G]�^Ec�PK=�����b��Ƣ�7��<{�i1=��p�r@v6�~��m ��v���Qb��������ad���B'$�w�=z�Vp�P�s��3��|�ՠ��(�z��B�¹vH�D��1{D����'r-�8��g�����
 �^���d���K�F�G�,r�ٮ�t���4�ʃ0����gyW����y�Xڊp��U{z#��=l5��$Ҿ��YB��L�2�N�Ҹ0y��!�����b�k��0(��-���j������7��G����Q��Di!�oe碸g?��<�T���F��I���)?V���,1�K��L�6B:G�I=R]I��jcDo=�e�Ҍ�a�gK� �=���N�k�On����ݫ�A-����ށ���@��IJZ�C~_i�Չ���f��j�Yaj��Q�q�_���{0��7��k�]/����������_�EB�ꚼ=Eo�>-�����^9������� �W� �K���QC/����`5�e��_�4�؛�w��1A:�"x�P��V�������?7��GrcF�"1�F9�nz���BOT�������#�@{R���C�ܕHm�ZBk�vj�C[��N�Pa��˹¼�}��om¦M����!��ʠ�j�����?��O=&
�� �2����+ϵ瓇����X�e��l�{�ٓӭk�^���b�o���zV�#��c��AL�k�A�%a�;�G.�ȃ���=9 �9JSL!N}��=������|��;/��lwF�up	�m��>}��S�p�&GMV�o�������ݧ�m���JTNBg�R���3����PgC۝A`v��zCp�LWGl�P�q���n�?X�c#�{�O�y�|_Zz>��߀>��e}��Oپ��'������S4]������6�=�����_L�W�W�N��ty9ƒd�O��zEs�Ou�� Љ;���c�����Hnl��(��MD�T�#���.>L�7[Ty�a.�=���۲�� ��+wrc{_����^��+���wA\��b<�S�Rj*��$~�"��Z���9����Xs���2�FJm>��w���l�C�k��+GP9�n{�����fY���m؊-�HȦ�6G�h�����߂������E��ݕ��-�/
�W����FѺA�����&[�xT�t�e���&%M͝B7�@]���:�m.\�n�B��z	�y�hk0�2��n��L�k�'�\�*�t��7�`�A���չ��Uo�O0�V#�Ɔ�q��ESר5�շ�Y=���'x�:J�נ"�Kzc�#��S,u޵���Px��:XҀ�����c�չ���I�dh�lE#0���E�'��֯:�7P��mǭ+���l��M��B$�׳7R�I5�Խ��$�4wG�S�#LV��i}�S�s�D8�䆾\�?C�Z�7�pJf�O�ۏ�7�?݉�+�?yMS�iJMsj�v���1�Q�i񻀞|>�&^J��h�Y�§_��vb�[|��$u¾��S����{H{�I���*c ����_C��V��Q-��
�ꓓ2L�\�
������7��Ѧ�]#���`7��*�ݛ�<Ã�_9�t��w���T��?]ٞ��F�I�Wx�Ws�a�/,��u� -�����a>3�u� f~��- ��?4�qLf���n?�����؈f����w�:�D:\�(3��S����=��
La(�m8f�ݽ�>�F�_4z$��V_%���x�gj�ݽ�1x[��B���\�zT�ٺ1��O�<�/v�O      �      x������ � �      �      x������ � �      �   !   x�34�43�4�24��P�B@�=... �E      �      x������ � �      �   '   x�33��,���S�,IM���LN��2��!	��qqq N�      �   9   x�3���,JM.*�,I-rH�H�-�I�K����H,�HM)H,..�/JA(����� Oi�      �   �   x�}Ͻ
�0�9�)�-�i;8W������㵍MH������q�ȐIM|O�ʘ�.DU���(��ı|�����Ȍ��Ȫ܅���y�]�I��M��ʎu�w��.�;��&��F|m;��|���э�S	͂�ٓ��X�uKp.�<SH�     